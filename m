Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833BDC43458
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 03:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=++xPNOPeREpY4gCo4ajCNGLsmjHdnRGu+s5z8t1lDAw=; b=my+j0XV4QHLdWUFtPMPza4/s1m
	c3CQPwyAAJIrJ2DRrKqsKybQkBazCxgi9xM7d6q+cSi7Bu7aCeTm6JpLISJ3VrNcOeoE1FGpD0e6H
	xUUwbTvnDiBhtfSSmR9S869ZkuMA6SW63Xr4u51J8SqNRq2ZovLcjKV1R1wgFf5C0pCmO5FNx8Hu3
	g0xQi/9PrODVsvi7j9NOcWeO/kpxp38s09hjxv0pkSRPR2CbaSFcLX2z2XO5ixOgM8ZFz+U1JIVYf
	dkYLyb592u4ZI0NBoEAJLtBYskrE1brGHc34r+iIGgus8E/CUQ8RIunsPZ/4Gf4nRI2E6dcVzTlMU
	PvzXl45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCuH-0000000GMQm-0mym;
	Thu, 16 Jul 2026 03:37:05 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCuE-0000000GMQM-15jv
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 03:37:03 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ca7c1176317so4530330a12.1
        for <ath12k@lists.infradead.org>; Wed, 15 Jul 2026 20:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784173021; cv=none;
        d=google.com; s=arc-20260327;
        b=g/Bjrqxb9tAaV9lxZc5bENGBLevKTItv1x+2wWlHU8wegTlZrzIlXlcPrBeIvVRP87
         cC7K39JX54afBR5Yj/ZjSlpQt9okIJrJ0JzZQeJq9m9sGc/hsfP9kbxORvPn+rGNOj8P
         XjtXw9n9ZmhDyBQBDRWk7gu+E9JKUlsqzdEeMTJQ0UY5Zy7e/YgVhnIol2WPKq7Af+L9
         HpCMVjChvFITyfb7aFtQqqL0hLiHUBqIvrmTJosBfHd546VXBfCFibdWpemUffLt7Uye
         w4IogO11+6rw1faSj4SzQZq3lFhH0jn9WF4utxmFAhbEAQv0rvEmelptFF8958aYRRT1
         qPHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=++xPNOPeREpY4gCo4ajCNGLsmjHdnRGu+s5z8t1lDAw=;
        fh=3Wh7BGHdb3PxEJScgAGGZIxiQnxRxVF/Odmwd1X6W2M=;
        b=CN7CS3qno2PDcXxTxvZW8okOoxLC1eMAKSa5Lq2yfNTjIq7+hieFohd4SxXZ3fAhY9
         GepAvNAY6tGsO+t9FhjxU5MwKKpCmBxghgXbT5L0eMUln09X6aI5wvzDr4/mEN36fxhf
         MkfKYapTW0uy73JLp7MPiQKu42sluYLK+a5s5kWR6DH/DZvQGfiQ8x1gJCSRetkTq3Ry
         IX7WS23yGFZ9ch0eypepuahs4ZdoDn1OT+O3SsPy20zepcjjqTwMOQFMdwbW9uClMqWI
         dX3X21Hyyv1AarR2w6akczkGL4NESFlXs2EaKLOB4v4tsG8ToOOUWdajlhU5etY2YfX1
         jwcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784173021; x=1784777821; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++xPNOPeREpY4gCo4ajCNGLsmjHdnRGu+s5z8t1lDAw=;
        b=hiMnG/BRyx74WyfGUH3c7Zav0++NDJ2yLVzwzOVZW1m2vabra+A/Cc0rKOZpX1Kvcz
         SvF4uAiNggAG6GccOJQyvayPx0k/L0iEFB2d6zIyOBQPzijkub1Y0FDQhUdNuzp0O6ll
         LTt35YeoQJxKFSDo1vlMsne3vn7j6L2rxXz43Wqvm23jn3D5rWrNT8ZxZMB6VBTl+T25
         yrzzGoIf/y1OgWDcNRP82JBLTaDOHOZxJc+gABJRd/F2i/XNEI3vFxOtqjdBMP0uVeyS
         sdTeo1CkR3uaC76iUnIEopUuElTR+uPZ5pcHnpxSU3ziLVArd6wJEI5bn+xX7NMNSBeq
         VIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784173021; x=1784777821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=++xPNOPeREpY4gCo4ajCNGLsmjHdnRGu+s5z8t1lDAw=;
        b=K7QOlzvleLzUhTbLzSwc9ahC8e/YPWGQlSLaxpWkHFxjVF3H6KLBTC3G8dxrB3seEM
         dAsN7K5Gkpk46H2c2DrKumLkLTAu/fIHEzn9vh/wu14cHL/aFtsQ2cXNglcsrUSYUKJJ
         mV+IPSwrxhefrJIguwR/nEsrtCTTQKIJOk/2Vrsz6x4d8xXi9usfDWe2NNxWjlsphTWq
         eSLx1cyo9oWJFxhk2TjXKUzFibS1GipdG/4KetS2RhRyMAdfL+YuGUmzRx4MEqk0tiC7
         lvsPWN83xf92xY14Onz5AZeYy3SpdDILXmyPABjXUX1Ydxk7VEbARsHbrOARxexhVi/x
         iLkw==
X-Gm-Message-State: AOJu0YxICDsA3G/WCTxapENC15iEOwPd58jKGYB47JtEY89NhYjy7z6I
	mt7aPRo107BBXv2exPaozu9W+A829JRznFl8TCeFX26TyVRCRSD67HYgjWYGL2182umFr9hsQ3W
	kMi16NT9izPdlV3ZAkRR/6Ty91xFu1hJoEnrd
X-Gm-Gg: AfdE7cnneyOkT0yqD9H1Es+T0x6kC0sZKuLhs840kp70TUyf7oeoPywyaeenK5SEwyQ
	IO5Rq7qZLqFUTzNfm5/rldiRWcOE1SYU7+e0ZOAEh2NMIR9s2XCaKJf0/l73lLWdoOlyrGR/v6K
	oXQAPsfq7XCJIl76zCqhY+Y+lchFOAtwjmeBeZSkH50HVZylzKHDXJIcV1HGUMTPJ/pjzz9I24W
	wtElpAaSGeoFDK/guzHZT3ijUDQz04xIVt38ouMKoTsOaSFGMQ3hQeSl0b+qDiiTHGc0TDNkDhH
	uaGkMZXx4gJRCvAN4mhEhqMwd6QLhZc=
X-Received: by 2002:a05:6a20:7347:b0:3b4:c9d5:cd5b with SMTP id
 adf61e73a8af0-3c36c0f6d1bmr5645717637.13.1784173020542; Wed, 15 Jul 2026
 20:37:00 -0700 (PDT)
MIME-Version: 1.0
From: Mike Garuccio <mgaruccio@gmail.com>
Date: Wed, 15 Jul 2026 23:36:47 -0400
X-Gm-Features: AUfX_myaWIWReqY2lk9gfQSj8KILG7qLkd2EhVi6NUrAOKnpUQG3B49UdOvqG7k
Message-ID: <CACfdPNH1Hgz70gYNRFBupxzjpOyBAVBPdxF+f_OLRUwMwXmXFg@mail.gmail.com>
Subject: ath12k: WCN7850 fw stats permanently wedge after AP channel switch
 (v7.1.3, includes 8f153eb74546)
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, baochen.qiang@oss.qualcomm.com, 
	jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_203702_309589_1E5452D1 
X-CRM114-Status: GOOD (  11.00  )
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

Hi,

  On WCN7850, an AP channel switch (CSA) can permanently wedge the
  firmware stats path: after the CSA, every WMI_REQUEST_VDEV_STAT
  request times out with

    ath12k_wifi7_pci 0000:0d:00.0: time out while waiting for fw stats done

  repeating on every request until reboot or driver reload. The data
  path is unaffected (still associated, traffic flows). Because
  ath12k_mac_op_sta_statistics() falls back to the fw stats path exactly
  when the cached rssi_comb is 0 (the post-CSA state), every station
  statistics poll from NetworkManager then blocks ~6s in the driver,
  producing a continuous stream of these messages (~14k/day) and
  D-state polling processes.

  Environment:
  - WCN7850 hw2.0 PCI, chip_id 0x2 chip_family 0x4 board_id 0xff
    soc_id 0x40170200
  - fw_version 0x1103006c fw_build_timestamp 2026-03-06 09:10
    fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.1.c7-00108-
    QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
  - Observed on 7.0.12 and 7.1.3 (distro-built stable kernels,
    CachyOS). I verified v7.1.3 already contains 8f153eb74546
    ("wifi: ath12k: use correct pdev id when requesting firmware
    stats") and 7259b1a0e54c, so the duplicate-reply issue fixed
    there is not the cause here.
  - STA mode, single vdev, 5 GHz.

  Reproducer / correlation: three occurrences over five days, each one
  starting seconds after a CSA from the AP, e.g.:

    Jul 14 03:48:01 wpa_supplicant[1403]: wlan0:
CTRL-EVENT-STARTED-CHANNEL-SWITCH freq=3D5765 ht_enabled=3D1 ch_offset=3D0
ch_width=3D20 MHz cf1=3D5765 cf2=3D0
    Jul 14 03:48:02 wpa_supplicant[1403]: wlan0:
CTRL-EVENT-CHANNEL-SWITCH freq=3D5765 ht_enabled=3D1 ch_offset=3D0
ch_width=3D20 MHz cf1=3D5765 cf2=3D0
    Jul 14 03:48:06 kernel: ath12k_wifi7_pci 0000:0d:00.0: time out
while waiting for fw stats done
    (then repeats every ~6s for the remaining 4h20m of that boot)

    Jul 15 00:10:01 wpa_supplicant[1273]: wlan0:
CTRL-EVENT-STARTED-CHANNEL-SWITCH freq=3D5765 ht_enabled=3D1 ch_offset=3D-1
ch_width=3D80 MHz cf1=3D5775 cf2=3D0
    Jul 15 00:10:02 wpa_supplicant[1273]: wlan0:
CTRL-EVENT-CHANNEL-SWITCH freq=3D5765 ht_enabled=3D1 ch_offset=3D-1
ch_width=3D80 MHz cf1=3D5775 cf2=3D0
    Jul 15 00:10:10 kernel: ath12k_wifi7_pci 0000:0d:00.0: time out
while waiting for fw stats done
    (then repeats every ~6s for ~23h until I reloaded the module)

  Boots without a CSA never show a single timeout. Uptime before the
  CSA doesn't matter (one wedge happened 40 minutes into a boot, one
  after ~2 days).

  Additional observations:
  - It is always "time out while waiting for fw stats done", never
    "time out while waiting for get fw stats" =E2=80=94 i.e. fw_stats_compl=
ete
    still fires, firmware is still sending WMI_UPDATE_STATS_EVENTID.
  - The WMI pdev temperature path keeps working while wedged.
  - Recovery: reloading the driver modules recovers immediately.
    From code reading, nothing in the SSR/restart path resets
    ar->fw_stats, so firmware recovery would not clear it.

  Analysis: this looks like ar->fw_stats.num_vdev_recvd getting out of
  sync. In ath12k_wmi_fw_stats_process():

    is_end =3D ((++ar->fw_stats.num_vdev_recvd) =3D=3D total_vdevs_started)=
;

  num_vdev_recvd is only zeroed by ath12k_fw_stats_reset(), which
  callers invoke only on the success path, and ath12k_mac_get_fw_stats()
  does not reset it at request start. A CSA is executed as a vdev
  restart; if a stats event is lost/late or arrives while
  num_started_vdevs is transitioning, the request times out (no reset)
  or a stray event increments the counter with no consumer. Either way
  the counter is left non-zero, and since completion requires exact
  equality and the counter only ever increments, no subsequent request
  can ever complete =E2=80=94 matching the observed permanent wedge on a ke=
rnel
  that already has 8f153eb74546.

  Happy to test patches =E2=80=94 the AP in question does a CSA roughly dai=
ly,
  so I can usually confirm within a day or two.

  Thanks,
  Mike Garuccio

