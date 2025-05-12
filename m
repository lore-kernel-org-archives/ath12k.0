Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97088C3ABC3
	for <ath12k@archiver.kernel.org>; Mon, 12 May 2025 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bnl8hA3nP8vUN2bbvGHBptP98bLAkddYvA43YaeAKVc=; b=uVOCT3/n8QJYzzZ6c5oKskfC4E
	hlr/cJb3iRsQNvTHr4bqEJYMSApyy0n7GcM9sTGNKX0otlk2R6prAEY9U3bt9m8EBOuY+++a6RT9C
	/RwM+tYd5i91Os/UlC66aNYtDZFHcr9q6J+pxb52dU4RKLNLHzQR6coyCZQPWIPIyU6uJAjwNHy5o
	VwMT6Z1PBo3CUI6oMRZ0FEqcgxjYU3hH6/KtfUiGitTNF4DEiKyjFfBahTPO/0uCjenZkVrXDALlN
	SVIiaOE3bEVrb12/dpI9CHDvplsWY43iuL9dOVXyjGtpO8x/PAFVhxoKfrZBCpMJIjTEpOuDdN6Su
	Kb4YD3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQUj-0000000975E-1OlL;
	Mon, 12 May 2025 10:34:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQPd-000000096U2-2cbx
	for ath12k@lists.infradead.org;
	Mon, 12 May 2025 10:29:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a0b6773f8dso3501830f8f.1
        for <ath12k@lists.infradead.org>; Mon, 12 May 2025 03:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747045772; x=1747650572; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bnl8hA3nP8vUN2bbvGHBptP98bLAkddYvA43YaeAKVc=;
        b=GdNU5CxT46H6BtyPYytw20T5MCDutJpdBg3Mdx3tDiEQbAVRx1PP4m0Cln7Lol2u/5
         7pDc224kC+RnHek93rK3UAPwzjOYWDfTk7Q+Ubm2/rhByYesS0EaNz8G5rpTT72VX6jR
         odLsS24la6d90nryuqIZh4q5m0F/8rPvljDONJhdV+W9CkN7gA3v5kG2g6FERv95EtIH
         zt9+VPdPLU3sBT+TCA7rVrUJZghnyCWD4BnXC01kbw8INEUkWq5HMRcl8RfjT31MWR09
         o1qMBZx8DQ7q+imaPw2gMXG7lffAddclIY1uimQRcdst5W3ZFdIGDCuUEFDFRfQaZvYP
         1Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747045772; x=1747650572;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnl8hA3nP8vUN2bbvGHBptP98bLAkddYvA43YaeAKVc=;
        b=C8CZgd+wByzCq9y5jsRunBPc1assttHR6zUQcBc9FWtA5b80CIZD/DaNoupA3X2in4
         rJf8EfrxkefmXk9y8g1tz40dEYmEHRo2DhsruqKI2V4n+Xz2CWRQhHaniOi7m5RbVr5G
         baPRQp7Fa5EfKhpuY5jAFcPYmuofYhl+j15XSXZOLsqh3B970EgX0si6rKwrQfM1n/Tx
         wNLWJbSs544PtJPLH0XR3Ll4EF0WFYG/OolfZmTbjNlbOQuMRW+O8STSJySojXBuWFWT
         nHFvaWkDFMvhzjEswsOL32b0ZCKuboCbn+wgZVMkfDC9kkRulWQmCDf02AG4KJc4P5of
         I2Sw==
X-Gm-Message-State: AOJu0YwdDKqYwlMNPJHgKsQHDQvn80nbCydQbH2SQpCQUwmUp67vU5gR
	koV+4lhbHVjfJ1ENzEYbvpww+1NP2E3mIomH8cK3gPd/AncjZH8xUQ9nEiYERMSxCmDQowLd2xh
	awHnJVGVqCgiYQ5TuL/xSxzR4NypSvRXXOj4=
X-Gm-Gg: ASbGncu59KXuR51YGVGM1G6Bgul3CDWsndPtsOFQmPWT05Ew6sCBDx6Qt3ihrYPQZzd
	70Hy540+duqeeM7U941CGvobWNpTfhl2v3/55StRvTletpOsdTRCnaUUJV7sM4VTWUU7SbO6ctm
	dDrX7COmjS/g0f+ITNlNU1Vgdiz4+VknYJ
X-Google-Smtp-Source: AGHT+IGaNYf1FEKFxns1NW+yKIJuk2XZUXEpgkoRUx2Lv2kj62O9G+2RJp5RngtliYBwqbOqQCI8/cH4Q1niC9i3nH4=
X-Received: by 2002:a05:6000:186e:b0:3a0:830d:ec58 with SMTP id
 ffacd0b85a97d-3a1f6446e78mr9520608f8f.28.1747045771620; Mon, 12 May 2025
 03:29:31 -0700 (PDT)
MIME-Version: 1.0
From: SIDIQ BAKTI <sidiqbakti@gmail.com>
Date: Mon, 12 May 2025 17:29:20 +0700
X-Gm-Features: AX0GCFskMl3Rd7dED2ldyertgvCBOYDd7J4MQjrfKGjnGsmRURVkqyoJoIzUjD4
Message-ID: <CAKyS+Cbdy25Y2ii+=DLA1EWkvCySYEOmSkBrrcHhy5mXGJ5ksQ@mail.gmail.com>
Subject: Missing board ID 4634 in board-2.bin for QCN9274
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_032933_664617_05E4FCCA 
X-CRM114-Status: GOOD (  10.95  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi ath12k devs,

I'm having an issue with chip ID 4634 which is currently not listed in
board-2.bin.

I recently purchased a WLE7002E25 board from Complex, which uses the
QCN9274 chip in a DBDC configuration with a diplexer. I initially
assumed the chip ID would be the same as other QCN9274 variants, but
it turns out mine uses a higher board ID (4634), whereas the latest
board-2.bin only includes IDs up to 4121.

This setup is mainly for hobby purposes. Here are the specs of my platform:

**Board**: Photonicat (Ariaboard)
- Rockchip RK3568
- 4GB LPDDR4 / 64GB eMMC
- Renesas RA2E1 Cortex-M23 ultra-low power MCU
- Dual M.2 (B+E Key) PCIe via converter to mPCIe

**OS:**
- ImmortalWrt SNAPSHOT r33919-09241815a1
- Kernel: 6.6.87
- Unpatched, using latest firmware from [CodeLinaro ath12k-firmware
repo](https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware)

in the dmesg logs

root@LoliskWrt:~# uname -a
Linux LoliskWrt 6.6.87 #0 SMP Thu May  1 14:33:10 2025 aarch64 GNU/Linux
root@LoliskWrt:~# lspci -mnn
0002:20:00.0 "PCI bridge [0604]" "Rockchip Electronics Co., Ltd
[1d87]" "RK3568 Remote Signal Processor [3566]" -r01 -p00 "" ""
0002:21:00.0 "Network controller [0280]" "Qualcomm Technologies, Inc
[17cb]" "QCN62xx/92xx Wireless Network Adapter [1109]" -r01 -p00
"Qualcomm Technologies, Inc [17cb]" "QCN62xx/92xx Wireless Network
Adapter [1109]"
root@LoliskWrt:~# find /lib/firmware/ath12k/ -type f | xargs md5sum
25e7a02febd6d419594d074f8d5d6788  /lib/firmware/ath12k/QCN9274/hw2.0/board-=
2.bin
3616c32d0e0b8c131b3e0e42e030d82d
/lib/firmware/ath12k/QCN9274/hw2.0/firmware-2.bin
08e77df7b9ab5e4c78bfee1c9f025672  /lib/firmware/ath12k/QCN9274/hw2.0/Notice=
.txt
root@LoliskWrt:~# dmesg | grep ath12k
[    6.822644] ath12k_pci 0002:21:00.0: BAR 0: assigned [mem
0xf0200000-0xf03fffff 64bit]
[    6.824009] ath12k_pci 0002:21:00.0: MSI vectors: 16
[    6.824482] ath12k_pci 0002:21:00.0: Hardware name: qcn9274 hw2.0
[    7.638688] ath12k_pci 0002:21:00.0: qmi dma allocation failed
(29360128 B type 1), will try later with small size
[    7.659500] ath12k_pci 0002:21:00.0: memory type 10 not supported
[    7.665751] ath12k_pci 0002:21:00.0: chip_id 0x0 chip_family 0xb
board_id 0x121a soc_id 0x401a2200
[    7.666595] ath12k_pci 0002:21:00.0: fw_version 0x141580c7
fw_build_timestamp 2024-11-11 11:03 fw_build_id
QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
[    7.697939] ath12k_pci 0002:21:00.0: failed to fetch board data for
bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4634 from
ath12k/QCN9274/hw2.0/board-2.bin
[    7.699116] ath12k_pci 0002:21:00.0: failed to fetch board data for
bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255 from
ath12k/QCN9274/hw2.0/board-2.bin
[    7.700276] ath12k_pci 0002:21:00.0: failed to fetch board.bin from
QCN9274/hw2.0
[    7.700940] ath12k_pci 0002:21:00.0: qmi failed to load bdf:
[    7.701442] ath12k_pci 0002:21:00.0: qmi failed to load board data file:=
-12


forget the QMI dma, can skip =F0=9F=98=85

 i already tested using this latest firmware
https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware
but still can't find the ID,
I tried modifying `board-2.bin` on  `board.json` by mapping 4634 to
4121 (closest match) just to test:

{
  "names": [ "bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4634" ],
  "data": "bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D4121.bin"
}

This made the device show up in iw dev, but instead of showing 2.4GHz
and 5GHz, it shows two 5GHz interfaces. So clearly it's the wrong
board file.

Would it be possible to add support for board ID 4634 to board-2.bin?

Happy to provide further logs or test patches if needed.

Thanks in advance =F0=9F=99=8F
Regards,
Siddiq

