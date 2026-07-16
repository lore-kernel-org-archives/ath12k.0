Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC15C4450A
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/haUbnenaAfpccw+mnz2xLOMOiS2FiSNt2s1aPzvdeI=; b=FszgUmzXHOiJ2r5Z4pTt564d9e
	LHXgg1swGvDZKUj5M8yut/ZA4/87BNn7wk3b7GUszVDnheg5Qa+8YpktE8m9tv5gu2saWziTg18/A
	rThoo2WpUplWvv19AcuymvvGrErL14nfpdXof4GKJ9U2+kefAJYXK0tof8DECnS3BGKrxrFwi3H0N
	MMzQGt9bR15oP73CYlQx9PSxESf2mfLuqbS40rZWBbIVyXC22oGLCgYlr1ng/+HIvSmwFRbQB3HFH
	h45QlClwwBvrmWCdgNLAn0o23UX7uAwbtJ1rtEQ0m3IZBdfNKFPsAcpSqN/Kv5sKSAOSpLndHe56g
	jL6SKp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJhG-0000000H41Z-2OTN;
	Thu, 16 Jul 2026 10:52:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJhE-0000000H411-1THa
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 10:52:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rYWO2247735
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 10:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/haUbnenaAfpccw+mnz2xLOMOiS2FiSNt2s1aPzvdeI=; b=CEzffjhj05ugwIyI
	rWimrVSSDp42vFQLCxaTBswxGwexNX5v7YpxF1h0RJF+OIj9QC9xqgzDXWmSZHON
	Yf8UKG0qa6yBjvI8WjvYOH+WD1ESYoaIeuSEwBSfQwvTIY7dW+5halsBCx9mGkUL
	NsndQ9f827Kr8M9kqvzQwXm1qCSN6nKQjHBrnvXlZs5AbuDeEmLtEA7ZoWJ0fpc3
	hF4BIJx/tS4yUz3OPI02ExfZ55O8wFhseXlK5NCiVAyUK0ZC0zDi7KL2wiBAdTn9
	VtWTW3eFcjqW1DdyKvjNGZJgrG6C5FYF2GyGArD5hATUXfsButLZ7GQige5hHfQK
	Reo5sw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvbdqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 10:52:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso5018593a91.0
        for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784199123; x=1784803923; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/haUbnenaAfpccw+mnz2xLOMOiS2FiSNt2s1aPzvdeI=;
        b=cXhdA1Kjfjm0YP66daD+TwCNPe3rqj5IaID3nSUBzPzt9AuC8m74apI7to5OlgBT8g
         3MM9AQpJkrZSPqI9lP7wqVflzoGI1wV0R2dAHCdK9DIx8564mevpscMpDS+Bzmg7B0Dz
         O2KcvqtDetfsAIxV5Kc8IFSecaBQgn7wo0JMyM/hV9e8IlLUNcQ9K58tugC5Hq6xP+bL
         DsOE/JWbSBSKaiMBAfkg8me1PpLUNRJV6/BBau0XgRrUN4RYaI/lEbhrP/H7w7VtBcmS
         MPUwa/h2NZQ5LkeVEV0spLUCRvpRSDwH82GsBLEZrTYrWiHh1Zn8PgE772LybMp/zthc
         MjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199123; x=1784803923;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/haUbnenaAfpccw+mnz2xLOMOiS2FiSNt2s1aPzvdeI=;
        b=huuZFZuB1LOOxeQGttiwg5gyw3WttU/DPeii2CrClttoGmAfnx1NEFyyXj6tQs41wf
         Ilw5kfEi3/Gt3I5uJOaol+WbYEU1J4iXlyhDE/qRjx4DsRIGvAdZaQad/2U/gvGBSu8D
         obgAHXDoaXa8y7HnlHSL8THxm6KWJS4Ox2816MgC/VRNzi93KdiUq/xBJ+4+KmqFVmZM
         siyseqNezjmSj0O7xSCzfGHD90C4dm2veEHYmE93WGiMm/KNmuMYA7XyeZKzFsgTnyjg
         ATSgMNMq+HUO/0jVArcaK3syn1GCt4y5J2MfI/qu/qLbKmsVvqw6p/0+g/mYQISjZaOD
         BwOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoU6ziRPkNSPl+iVB6k9uMH64Ep5+Ii5yBK/OSgeAeHtG0mQKeM/OwYy315q46tfSsaxV7B7Po=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMPqFHd0Xs471yVXzzAHsQwuLslicD4qbsxlBnsP8uDwKUoDRz
	6OKxxvROGTFZGUlv0AWW4Szrz/t/Gs2NgZ2KMyeLKvXtGhNxCTICAMU0Kez2STHy6EHiuXYo7F4
	oL/3eKcZ/A6JvK3Jci3ICQfBW5zxWObNshx2G5a1pDVeC1/ZzD/AuePEmtXFwbfUc
X-Gm-Gg: AfdE7cl3mE0w3eEzzbr7oJ6p3i1rqGp2Dpm6otIq9g6zJwvZvKUlvD/dt0XA4/TqClN
	TxTimRSZTuZLIOOlx2X1Gu8pU16hWivx76ryES6yXdz5+agNf9Iay3qc3+ii8MyAA07qzq6nIFb
	l0KCgezCcbvNBCjeRWX9h1tL/cFGdL3eewTuclHXPBZYn0TdyiUPlW1Bq9B+km/yAVztOiCFJN+
	zvsfg9h2EK0h5AcOZKg3heXQsNjyTJMc/XnQOIDyFvmdOFKNmXCLR3F60osPPswxLvvZ0IxLEyg
	5LPYqw2Nx3pQDw4obJswcuSLetu6gd2zU963gNNXAvNwMCGyF48TQyzc8bgJ+h2KRhUqezOEm+t
	lWgEK3RRk1FfP2wtabRG+hCsf3MBQxF2WBEMnIsFiBc0gNwkHSgMLaojDHN2h/IqQrdilMCXV
X-Received: by 2002:a17:90b:2787:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38e2a107e1dmr5587309a91.41.1784199122610;
        Thu, 16 Jul 2026 03:52:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2787:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38e2a107e1dmr5587294a91.41.1784199122152;
        Thu, 16 Jul 2026 03:52:02 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0d7bc6sm1105568a91.11.2026.07.16.03.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 03:52:01 -0700 (PDT)
Message-ID: <f9d0a06d-b7b0-4e51-8173-c53104c2a096@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:51:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: WCN7850 fw stats permanently wedge after AP channel
 switch (v7.1.3, includes 8f153eb74546)
To: Mike Garuccio <mgaruccio@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org
References: <CACfdPNH1Hgz70gYNRFBupxzjpOyBAVBPdxF+f_OLRUwMwXmXFg@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACfdPNH1Hgz70gYNRFBupxzjpOyBAVBPdxF+f_OLRUwMwXmXFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58b7d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=2_3R45MI0XgUL3_lzmwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExMCBTYWx0ZWRfX4nAMcIi3ZmtJ
 kCIQLf0ePE+DqMvtUkaZ8q7n/v1y5VDTYTxSovyf9Cae7D2mDOlXtAJDmOBe8a8thSaFeCjsat7
 t+0Rx2TAnfpeHcfqSoX0VNRHC6/Ja0sx65cfADlFUwAPYFVla6SOynSHjHHX294hhVySlJV+sMg
 1nLFdyrSO2EHHweZgZZ0LPPEwtdb3Vq6mnGO6O2AWsVdjD78s81BnmzH2cPVoR5XCAVJtTPQsVU
 P417W7pWnXt5ChcXSRHdxJ2KJERE1c0mLF1fX2Ki9zsONJrUSqKyj8sqBDAd8GesW72sRJWkOW9
 nkAahJdjhigm1RlNs9OE19U+P+W7psD8rUC49YBRL1JUg/r49Bk4Mi+gNxRHurzgBeHB0XnLOcj
 iKVDePwKx7MMik0Dq7NKlilTBq8iDQClxVFyE52Qq+o6ccKKo+WC/ct1BdoMiQRbFO3GhoFCMpv
 Mo3q/5mpxNH+SuiJ0sQ==
X-Proofpoint-GUID: rSvS97kH5_pZ1H4CucVSTTS-n--1eFR0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExMCBTYWx0ZWRfX42/ZhEaCUuNh
 PMsRz+ZRqpg9M+Pmcb2ptPH4QtnE4R96U9mFTc0QQCaNG5GEfTDbckbreKGg1KH7auvuhMM825s
 sQzyflkgtDn3kFvLcLeDqiogL+mk/n4=
X-Proofpoint-ORIG-GUID: rSvS97kH5_pZ1H4CucVSTTS-n--1eFR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_035204_398863_3A53FE9B 
X-CRM114-Status: GOOD (  26.42  )
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



On 7/16/2026 11:36 AM, Mike Garuccio wrote:
> Hi,
> 
>   On WCN7850, an AP channel switch (CSA) can permanently wedge the
>   firmware stats path: after the CSA, every WMI_REQUEST_VDEV_STAT
>   request times out with
> 
>     ath12k_wifi7_pci 0000:0d:00.0: time out while waiting for fw stats done
> 
>   repeating on every request until reboot or driver reload. The data
>   path is unaffected (still associated, traffic flows). Because
>   ath12k_mac_op_sta_statistics() falls back to the fw stats path exactly
>   when the cached rssi_comb is 0 (the post-CSA state), every station
>   statistics poll from NetworkManager then blocks ~6s in the driver,
>   producing a continuous stream of these messages (~14k/day) and
>   D-state polling processes.
> 
>   Environment:
>   - WCN7850 hw2.0 PCI, chip_id 0x2 chip_family 0x4 board_id 0xff
>     soc_id 0x40170200
>   - fw_version 0x1103006c fw_build_timestamp 2026-03-06 09:10
>     fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c7-00108-
>     QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>   - Observed on 7.0.12 and 7.1.3 (distro-built stable kernels,
>     CachyOS). I verified v7.1.3 already contains 8f153eb74546
>     ("wifi: ath12k: use correct pdev id when requesting firmware
>     stats") and 7259b1a0e54c, so the duplicate-reply issue fixed
>     there is not the cause here.
>   - STA mode, single vdev, 5 GHz.
> 
>   Reproducer / correlation: three occurrences over five days, each one
>   starting seconds after a CSA from the AP, e.g.:
> 
>     Jul 14 03:48:01 wpa_supplicant[1403]: wlan0:
> CTRL-EVENT-STARTED-CHANNEL-SWITCH freq=5765 ht_enabled=1 ch_offset=0
> ch_width=20 MHz cf1=5765 cf2=0
>     Jul 14 03:48:02 wpa_supplicant[1403]: wlan0:
> CTRL-EVENT-CHANNEL-SWITCH freq=5765 ht_enabled=1 ch_offset=0
> ch_width=20 MHz cf1=5765 cf2=0
>     Jul 14 03:48:06 kernel: ath12k_wifi7_pci 0000:0d:00.0: time out
> while waiting for fw stats done
>     (then repeats every ~6s for the remaining 4h20m of that boot)
> 
>     Jul 15 00:10:01 wpa_supplicant[1273]: wlan0:
> CTRL-EVENT-STARTED-CHANNEL-SWITCH freq=5765 ht_enabled=1 ch_offset=-1
> ch_width=80 MHz cf1=5775 cf2=0
>     Jul 15 00:10:02 wpa_supplicant[1273]: wlan0:
> CTRL-EVENT-CHANNEL-SWITCH freq=5765 ht_enabled=1 ch_offset=-1
> ch_width=80 MHz cf1=5775 cf2=0
>     Jul 15 00:10:10 kernel: ath12k_wifi7_pci 0000:0d:00.0: time out
> while waiting for fw stats done
>     (then repeats every ~6s for ~23h until I reloaded the module)
> 
>   Boots without a CSA never show a single timeout. Uptime before the
>   CSA doesn't matter (one wedge happened 40 minutes into a boot, one
>   after ~2 days).
> 
>   Additional observations:
>   - It is always "time out while waiting for fw stats done", never
>     "time out while waiting for get fw stats" — i.e. fw_stats_complete
>     still fires, firmware is still sending WMI_UPDATE_STATS_EVENTID.
>   - The WMI pdev temperature path keeps working while wedged.
>   - Recovery: reloading the driver modules recovers immediately.
>     From code reading, nothing in the SSR/restart path resets
>     ar->fw_stats, so firmware recovery would not clear it.
> 
>   Analysis: this looks like ar->fw_stats.num_vdev_recvd getting out of
>   sync. In ath12k_wmi_fw_stats_process():
> 
>     is_end = ((++ar->fw_stats.num_vdev_recvd) == total_vdevs_started);
> 
>   num_vdev_recvd is only zeroed by ath12k_fw_stats_reset(), which
>   callers invoke only on the success path, and ath12k_mac_get_fw_stats()
>   does not reset it at request start. A CSA is executed as a vdev
>   restart; if a stats event is lost/late or arrives while
>   num_started_vdevs is transitioning, the request times out (no reset)
>   or a stray event increments the counter with no consumer. Either way
>   the counter is left non-zero, and since completion requires exact
>   equality and the counter only ever increments, no subsequent request
>   can ever complete — matching the observed permanent wedge on a kernel
>   that already has 8f153eb74546.
> 
>   Happy to test patches — the AP in question does a CSA roughly daily,
>   so I can usually confirm within a day or two.

Hi Mike, great report and analysis. I think the root cause is the unconditional increment
on num_started_vdevs even for the CSA case. In your single-vdev case: after a CSA
ar->num_started_vdevs becomes 2, but firmware still sends one VDEV_STAT event, so
++num_vdev_recvd reaches only 1, is_end never becomes true, and fw_stats_done never completes.

Can you try below diff ?

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index ae874114dc51..83b3c68f328e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11447,7 +11447,9 @@ ath12k_mac_vdev_start_restart(struct ath12k_link_vif *arvif,
                                                   &arvif->reg_tpc_info);
        }

-       ar->num_started_vdevs++;
+       if (!restart)
+               ar->num_started_vdevs++;
+
        ath12k_dbg(ab, ATH12K_DBG_MAC,  "vdev %pM started, vdev_id %d\n",
                   ahvif->vif->addr, arvif->vdev_id);


> 
>   Thanks,
>   Mike Garuccio


