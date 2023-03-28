package com.alwan.customer.constant;

public enum EnumStatus {
    ACTIVE("active"),
    NON_AKTIF("non-active");


    private static EnumStatus[] list = EnumStatus.values();

    EnumStatus(String active) {
    }

    public static EnumStatus getEnumStatus(int i) {
        return list[i];
    }

    public static int listGetLastIndex() {
        return list.length - 1;
    }
}
