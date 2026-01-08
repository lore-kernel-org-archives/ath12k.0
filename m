Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9F2D1489A
	for <ath12k@archiver.kernel.org>; Thu,  8 Jan 2026 03:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7PXwKV2N6Les3ztKmWoLYUuV1uMp/vFDg6/giSKNcK8=; b=gpkLPBGcHe+7rkWTndpMfLKDb+
	DxIdgNmxArHdAyFM8zE1GVgiQ/XQodhQhDXHwUyOR7/juFlUK/7P54DJYexXbCWh4fk9iwqHG5DXR
	xAlHqy35oa9ZIMvrUcRTdulVaCFPWIYqzLO6cy9SltVLi0tu28OmOsvEsKYhp2Wq0EFWqI3Id7VxY
	JJBVPW9fyGH83uzzmI1IYrNMzC1wD2OtLnodY044992FwnsLDMZBLzWjU5+45Nr3yZD30moi85rm7
	ADhS449uuSpTo8HdpE9ZzTf0w0KmTJHfgHQKeDPztfS0cbjNshZpnFLxl0Ci1HXlpUUg4Xifw3Xdp
	Fq+a5nuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgbV-0000000FsI7-2aTa;
	Thu, 08 Jan 2026 03:22:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgbS-0000000FsHc-3YRW
	for ath12k@lists.infradead.org;
	Thu, 08 Jan 2026 03:22:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HTVOi3751449
	for <ath12k@lists.infradead.org>; Thu, 8 Jan 2026 03:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7PXwKV2N6Les3ztKmWoLYU
	uV1uMp/vFDg6/giSKNcK8=; b=g/J1U6i6gDNok/kzuvek3kexgPn+RkG1V6Dd55
	yym/s1VZzUfdzrVajYfYI3HhwTV82jCBHdpmc6UAOK56OwGuAUSx2RTpigeMowUs
	fnIH4cuLdSTHQ2y/zYzKEYTtgaIwrs32yjHw63ByPDrZL8z+BunTBSwsIJ7O1E6B
	Xf+ISlyhuOk8x/w37JuKLK1oDZwlhw0SJGXGQBEoDou7M5SxQDW+ZVWQqjE/mP/V
	721hzWcSfzqAwZwcJrG3Q6HnMpbohwNbuT7rw2RRqyOCfvVFGlxHh4rWhlhzpp20
	gCPb8rrZvRveEKpncpcALrerHQzf1nJQ6Mz8XpmTa17hseWQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcsn7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Jan 2026 03:22:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b609c0f6522so4547401a12.3
        for <ath12k@lists.infradead.org>; Wed, 07 Jan 2026 19:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767842545; x=1768447345; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PXwKV2N6Les3ztKmWoLYUuV1uMp/vFDg6/giSKNcK8=;
        b=dRAgEln8p/spYerKfzp78690EMF/7YP3F3y02W6pthe/OStNLMh749L+HM9deUkKIZ
         zgIxjZFIijhdnOAfhFXGYKBsgXbX1CweFCCT2pplR8cTAvpPNsGRMhtwnS6xsRGU+1+n
         FhmkertGL+RPl1LyYSwaU2eaR9VgtUvStnfhlofT7q9CRfhq7g8xo1b+EQ7sYBTz0Vxo
         VftNgPoCk4dznyEBYxzfop5ekDZJ+cBKnFrx7tDXLWD1Oe3q6P8qESAlCqtkUK0EIw6+
         xnrbO9tNgBcJu/DLw7sjFiwFqoAv8RDFMmn6IV0D8cjixuyIjvjhgZFDAxQyV1qS6LKN
         EC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767842545; x=1768447345;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PXwKV2N6Les3ztKmWoLYUuV1uMp/vFDg6/giSKNcK8=;
        b=ma06qQijIhflHFzL2DqB8TewOLoNZvfaLy0vnECkAF2q5k/W6NxP087O2ddQzVjohy
         Z7hlcV7he0OsAK7pfE9Cecy3ir2BWU1s6n0qmigiOJOKiv17c9gGdX0B0CyJJFDsY6Y2
         MAkeH/NSpCVt7Y8KNC96GcnGHxKaQXTogmhGmTa7j+Xu5vGtyvOE/gCKApPfLjC2q34U
         t1xPcry82+dNdlg0/myKYpk1eyvgAWWhs1oIb/IZDRHv87XU4j3ZpSh+zwgDqZySNMy7
         9boFbABmNImkYkjtZUD1zRtkF+oKxUL6YJwURr0MnyyBdhOGa3H/3wc8DU4t2HCmc1J9
         TJLw==
X-Forwarded-Encrypted: i=1; AJvYcCVtCNyHFLIbhdBhmUcdHFIB9BSHDq+gVFeNGXcNzFRsz+iBmJSbLiWYMwkZ+tU5/tsSLjxF1ks=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZTvJNyfkQSfcpCKrcER52Z5+8BsPZPCZMNmuvuW39h2dHvYft
	2dVCWGsHWAXR1oirppv8rDS3RsWuPLbU0099OxZrVOH6wsQLKh7CtmLPyH410Q7O3rGNLNJ1CIb
	fvxl/cKmwLUZN92CeUD9kTmx17ffIue9DBQVU8/dZ7QDXN5mh0WqdjQFQAs2VzJq8
X-Gm-Gg: AY/fxX6GuoSTZT7f00MDYaEscN7YZlbTMZsxurgYERLTd9nzIOe+XqBcRj89hNdo3cP
	d5qcxaWCZyUy+wx90Cj7S+4Bob0Br8ALOizLB4ve8UWyHi7qr/Ieccbrr+uJ+Siv5CKt7HTR1kQ
	Ei7wxg8lGy9vJwgGc04usaL1mlGC8VcLrgnb1hPYi+aS58X6Z0oiJjpz+FWKJ2IYN+4kiNHVVWq
	u/qSA8UhmPTMSY0CHrgbq4JDAp6IPSrPz+1UEsMJhhyD8OPB0GX2zDH9c8lamfMA0Xy1D0pbR62
	GXMN2hCF0W3tj5WRpP3scx7pmvAnh59XmCFUikoUmWRYl+v2D3/9ki0bCjQBseR6oMxiE8YEgWc
	kCQRsWC+Gpu6HJ36e5l9Qbrg+c9LoqcoXNCgdxniTpnjNXou9Kf7gvKokUhDHCgI=
X-Received: by 2002:a05:6a20:3947:b0:35d:2172:6010 with SMTP id adf61e73a8af0-3898f9904b1mr4702848637.51.1767842545111;
        Wed, 07 Jan 2026 19:22:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFVfouRyUmplzoXgfdGWuahXRjDDZ+DaSIRm+rneipYN8hW0cVcTS9EsNE1J7rHs/lITOURQ==
X-Received: by 2002:a05:6a20:3947:b0:35d:2172:6010 with SMTP id adf61e73a8af0-3898f9904b1mr4702822637.51.1767842544518;
        Wed, 07 Jan 2026 19:22:24 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc9e7e824sm6339625a12.30.2026.01.07.19.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 19:22:24 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 08 Jan 2026 11:21:46 +0800
Subject: [PATCH ath-next] wifi: ath12k: don't force radio frequency check
 in freq_to_idx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-ath12k-fix-freq-to-idx-v1-1-b2458cf7aa0d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMoiX2kC/3WNzQ6CMBCEX4Xs2SW2lR89+R6GQ4GtNEorbSUYw
 ru7IV69TDKZmW9WiBQsRbhkKwSabbTesRGHDLpBuzuh7dmDPMpCSFGjToOQDzR2QRNowuS5saB
 Wnakqo6SREnj8CsSVHXwD3qCjJUHDyWBj8uGzP85iz3/w8z/4LFBg2/aqLNWp7ovy6mPMp7d+d
 n4ccxZotm37AhFpElHNAAAA
X-Change-ID: 20251218-ath12k-fix-freq-to-idx-a3cf77f32f22
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAyMiBTYWx0ZWRfX1MGYx3mtSDse
 JwuaeAAwBKMeHDwpMCu8rO1MaPHvN26IRbsn6hBEIpGNDiFQBPiF8BZgftmcIysqWSbfJ4FItBg
 OAZGsGghI5phllvHeru3TyzGl8/YGjv0P6FtxR87ZQSYd44DMuXXUdhFILhgvkA7D8XIoPColo/
 +dtVvoBoMgViOxnU2u+s1mJjL1GuhYN4+cmv6Ggf1F8LQMdfXKeZTyGgbOaOYE5kYfetjpC0mYl
 49CahoxodTqaEuWXC6GOj0ArqeKgje/NdxfBhlfhq7f8ZlDFE7+dYzmGVb9nt6/13/0UilWJKJL
 7sqMgG1nLhjm9f0smSpLqyLHKttrXKiW/hw5SiiLelVFGtqmqv3ZzgeYz0r6DYmjneIGZuXvCgw
 coo/nv2WflB5MpDECcb87J+uKKgyVBEVoW0mzki3tqDPqcB9DREWgAUevZENQvUS2DryKPEmfeP
 85c/YESwsXv2i5z+Y6w==
X-Proofpoint-ORIG-GUID: UhSTwp7MTKeaKmRl6Ni0SzJbBSJyeYmp
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695f22f1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VOO-gYkIs3c7SNGsfqsA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: UhSTwp7MTKeaKmRl6Ni0SzJbBSJyeYmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_192227_260336_EEF31A08 
X-CRM114-Status: GOOD (  16.24  )
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

freq_to_idx() is used to map a channel to a survey index. Commit
acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in
single-wiphy") adds radio specific frequency range check in this helper to
make sure an invalid index is returned if the channel falls outside that
range. However, this check introduces a race, resulting in below warnings
as reported in [1].

	ath12k_pci 0000:08:00.0: chan info: invalid frequency 6455 (idx 101 out of bounds)
	ath12k_pci 0000:08:00.0: chan info: invalid frequency 6535 (idx 101 out of bounds)
	ath12k_pci 0000:08:00.0: chan info: invalid frequency 6615 (idx 101 out of bounds)
	ath12k_pci 0000:08:00.0: chan info: invalid frequency 6695 (idx 101 out of bounds)
	ath12k_pci 0000:08:00.0: chan info: invalid frequency 6775 (idx 101 out of bounds)
	ath12k_pci 0000:08:00.0: chan info: invalid frequency 6855 (idx 101 out of bounds)
	ath12k_pci 0000:08:00.0: chan info: invalid frequency 6935 (idx 101 out of bounds)
	ath12k_pci 0000:08:00.0: chan info: invalid frequency 7015 (idx 101 out of bounds)
	ath12k_pci 0000:08:00.0: chan info: invalid frequency 7095 (idx 101 out of bounds)
	ath12k_pci 0000:08:00.0: chan info: invalid frequency 6435 (idx 101 out of bounds)

Race scenario:

 1) A regdomain covering below frequency range is uploaded to host via
    WMI_REG_CHAN_LIST_CC_EXT_EVENTID event:

	Country 00, CFG Regdomain UNSET FW Regdomain 0, num_reg_rules 6
 	1. (2402 - 2472 @ 40) (0, 20) (0 ms) (FLAGS 360448) (0, 0)
 	2. (2457 - 2477 @ 20) (0, 20) (0 ms) (FLAGS 360576) (0, 0)
 	3. (5170 - 5330 @ 160) (0, 20) (0 ms) (FLAGS 264320) (0, 0)
 	4. (5490 - 5730 @ 160) (0, 20) (0 ms) (FLAGS 264320) (0, 0)
 	5. (5735 - 5895 @ 160) (0, 20) (0 ms) (FLAGS 264320) (0, 0)
 	6. (5925 - 7125 @ 320) (0, 24) (0 ms) (FLAGS 2056) (0, 255)

    As a result, radio frequency range is updated as [2402, 7125]

	ath12k_pci 0000:08:00.0: mac pdev 0 freq limit updated. New range 2402->7125 MHz

    If no scan in progress or after scan finished, command
    WMI_SCAN_CHAN_LIST_CMDID is sent to firmware notifying that firmware
    is allowed to do scan on all channels within that range.

    The running path is:

	   /* redomain uploaded */
	1. WMI_REG_CHAN_LIST_CC_EXT_EVENTID
	2.   ath12k_reg_chan_list_event()
	3.     ath12k_reg_handle_chan_list()
	4.       queue_work(..., &ar->regd_update_work)
	5.         ath12k_regd_update_work()
	6.           ath12k_regd_update()
	               /* update radio frequency range */
	7.             ath12k_mac_update_freq_range()
	8.               regulatory_set_wiphy_regd()
	9.                 ath12k_reg_notifier()
	10.                  ath12k_reg_update_chan_list()
	11.                    queue_work(..., &ar->regd_channel_update_work)
	12.                       ath12k_regd_update_chan_list_work()
	                            /* wait scan finishes */
	13.                         wait_for_completion_timeout(&ar->scan.completed, ...)
	                            /* command notifying list of valid channels */
	14.                         ath12k_wmi_send_scan_chan_list_cmd()

 2) Hardware scan is triggered on all allowed channels.
 3) Before scan completed, 11D mechanism detects a new country code

	ath12k_pci 0000:08:00.0: wmi 11d new cc GB

    With this code sent to firmware, firmware uploads a new regdomain

	Country GB, CFG Regdomain ETSI FW Regdomain 2, num_reg_rules 9
 	1. (2402 - 2482 @ 40) (0, 20) (0 ms) (FLAGS 360448) (0, 0)
 	2. (5170 - 5250 @ 80) (0, 23) (0 ms) (FLAGS 264192) (0, 0)
 	3. (5250 - 5330 @ 80) (0, 23) (0 ms) (FLAGS 264216) (0, 0)
 	4. (5490 - 5590 @ 80) (0, 30) (0 ms) (FLAGS 264208)
 	5. (5590 - 5650 @ 40) (0, 30) (600000 ms) (FLAGS 264208)
 	6. (5650 - 5730 @ 80) (0, 30) (0 ms) (FLAGS 264208)
 	7. (5735 - 5875 @ 80) (0, 14) (0 ms) (FLAGS 264192) (0, 0)
 	8. (5855 - 5875 @ 20) (0, 14) (0 ms) (FLAGS 264192) (0, 0)
 	9. (5945 - 6425 @ 320) (0, 24) (0 ms) (FLAGS 2056) (0, 11)

    Then radio frequency range is updated as [2402, 6425]

	ath12k_pci 0000:08:00.0: mac pdev 0 freq limit updated. New range 2402->6425 MHz

    Please note this is a smaller range than the previous one. Later host
    runs the same path for the purpose of notifying the new channel list.
    However since scan not completed, host just waits there. Meanwhile,
    firmware is possibly scanning channels outside the new range. As a
    result, WMI_CHAN_INFO_EVENTID events for those channels fail
    freq_to_idx() check and triggers warnings above.

Fix this issue by removing radio frequency check in freq_to_idx(). This is
valid because channels being scanned do not synchronize with frequency
range update. Besides, this won't cause any problem, since freq_to_idx()
is only used for survey data. Even out-of-range channels filled in the
survey, they won't get delivered to userspace due to the range check
already there in ath12k_mac_op_get_survey().

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in single-wiphy")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220871 # 1
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 150b04d0a21c..17ffc4822741 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6479,16 +6479,9 @@ static int freq_to_idx(struct ath12k *ar, int freq)
 		if (!sband)
 			continue;
 
-		for (ch = 0; ch < sband->n_channels; ch++, idx++) {
-			if (sband->channels[ch].center_freq <
-			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
-			    sband->channels[ch].center_freq >
-			    KHZ_TO_MHZ(ar->freq_range.end_freq))
-				continue;
-
+		for (ch = 0; ch < sband->n_channels; ch++, idx++)
 			if (sband->channels[ch].center_freq == freq)
 				goto exit;
-		}
 	}
 
 exit:

---
base-commit: e33fc1c6d54ee1569a57255e11c2978ba9a42ffc
change-id: 20251218-ath12k-fix-freq-to-idx-a3cf77f32f22

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


