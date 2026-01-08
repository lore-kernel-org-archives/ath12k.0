Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD87D185C2
	for <ath12k@archiver.kernel.org>; Thu,  8 Jan 2026 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UCWf1GYG01oCNT5JUBK9ciQvOCCDtItp2wmBxL7jzC0=; b=wo/4Xo1EN6Hfr7GyhttJxKBcYf
	ccPN9UUXu5n6JFelKIm5RQ3JwFhmPONBf1zGSSLemsRbcAFStDroojUPVuQ+Zs3N681jldw/mS8z5
	OKKrxmEk4bPMRJSKn4Wk6DzQUUHgr1SgpSFIbsIF1nu+0QPnybIbwgsxBgti8CEna2dkORtpXp9rS
	pStRK7Q7EeF9afE4lhex6Unw21+xfNVbr3yl33xhYCtw/Xrp2dQUIdXK9Sg4w4c6cJGm+Y4d8cXNq
	wGnj+MK9uqRCgRcby5+6hdf2ShvvCGZyH8cMrjUxMH5X+Ty6Xu55KHaUOLaC6ZXq9fB/YMXXmfVfs
	7/SwCGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnVb-0000000GfbG-3kqK;
	Thu, 08 Jan 2026 10:44:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnVZ-0000000Gfaj-3a5e
	for ath12k@lists.infradead.org;
	Thu, 08 Jan 2026 10:44:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VTto1838244
	for <ath12k@lists.infradead.org>; Thu, 8 Jan 2026 10:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UCWf1GYG01oCNT5JUBK9ci
	QvOCCDtItp2wmBxL7jzC0=; b=Mxk/qZbKHvx7D01uSV2gX77Q8Yxwik9NgMLpPO
	JfnbL8MaYFcSY7oW2XdO3/KTOFHznoP0/E1I1oet6tifAG89lsQSUPK+dRFPhTC+
	vtl35PnPRYH/aABf32FJHOTVkLuUCD9fwbi+cl0YKa28RZr2O3sLuXe8E8dYdqt/
	AjGsFDE8qX6nOwCgymX1Cht9ihhHvQ7cBVOHxgiqYVCb1JWKas9TDacwLVr5YKPj
	Dc/tF5jQWS7UB3ZL+enG+G2pyOBi98VgVtqJXABTLnLTdTLpwOmKTFoFin3H/o2f
	Eb5mzpUf+Vn/kpHgRFq3eLV6uxpzaZMcWd2kfz4SlzLWuPEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8920ktt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Jan 2026 10:44:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f2b45ecffso43865915ad.2
        for <ath12k@lists.infradead.org>; Thu, 08 Jan 2026 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767869088; x=1768473888; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCWf1GYG01oCNT5JUBK9ciQvOCCDtItp2wmBxL7jzC0=;
        b=PFk2VkNfhzj1c4pb7d6uK+CVYe57DDQbNf4EGFQea2rBUUqkZYaBaP3Ho40A76w1Qx
         pOqp5aACtrwVwPLAQo9EiXWwA6GP6sGQoosfFZjQInjAew1iiCejmv81cOwqOHhLVYM+
         5TgIlokH7LZfqahefKpWgtp86uJPqrqC+v6/bNCG2kt4OIP9kc0Pqy2AENG8efEmh9R0
         nGL28RzZxy4iMXcvlQuaHiDb7SmwxTirn8dQoUgpzCE55j91GBj7VqcQPdWICjfRp6OT
         Tzn3DUEn/0DqYKbIXAO3snUkEw5y6fdo7bxfcBtTgQLJJEyJixSNQZSDA6Iqlr3L/vT9
         vDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869088; x=1768473888;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCWf1GYG01oCNT5JUBK9ciQvOCCDtItp2wmBxL7jzC0=;
        b=qMwdDZPIKtvIeNheZoppmupnyYQjujNqCi8brkpehXoNiD3v+3xQa3dJsBh9TqyBB2
         q9KOrgYv/vBQ15B9Dk8Rp43bcTJrgZKRBk2wAnX+z4M/fL9QCiPTKFxkqguGnK+gPbeW
         lI3hjEWYpxR2WSGELCCvmku8Y3XXgWubw3fMhOlEDgNM4059ujvZOJ0IomyetGpteDFf
         T3BnhV6ybv+7Sic0tU55HYYMnZ5DZR8vXdBCX32vuYpcFbWlLhSZ3Kl4AWSujVBFWlT4
         Pe1jecY4IBEEueeo7bHbGYPlGxDfMmyP77Nd+nLoX1jynb6tNjC9gBEi6G1qzKGOBUyu
         WC8w==
X-Forwarded-Encrypted: i=1; AJvYcCU1TBdzVbbnF71YzE5pkmCKfBUfJRsz/5zg38qUIGpN+QVjoKB39cNHZdiDqY+58nJCw0dzne8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg7e2oaKAnqfZiLkWYsnefamJ6VkHYAy7JtxMg4jQeYh5zBKyj
	DBXANpr+IYts0TQv0eFUiVAUXOejW0vtVteBer51lMk0hRe2Lza51hHmsHyk6C78lB0LzMExZux
	YO7OsuwpzoQlvzmzFsJcbIpW/OZ8TmAwxKOSssxKgd5XqOkAGbeyv+L5JWRN2Kdcs
X-Gm-Gg: AY/fxX66kO+pVkj3ufosOu652D26dif+qV05Zo2pxXXiVQjw5NfFYAUfUVH7Vd/kn2+
	cQ4FNkDuL+T+Pci1HkWMWMdcH2Ut/Zxo4/TyHMA9v9D5ju26nRkOS61WWtC9w2VHgH0kkFrbYnd
	p0fHxFCpUSk7jY/kpB7kfYSNZNj1VXnu99YK2tDjf9MUv6jcwHJlyR0sgyjmY1tajGc8Dv6aK8k
	DlAw78nx4I25t+n4WppmFz77YyqO02a5kF2VFn3ZcyzSY8J/HU9N4Bsv2ZupCpaEE+0OK0P47sq
	7aWpe39v0VDnE+cUOtNJ6X/BIUg2KzMSaMkJJ+HwgZZ4vzl9gHAdWxmxSxPQz4URtbFPnZ1dbZx
	tROaSbr9kPp7RBf8tvhh/im3L6m1PaY33D+CqGxuUNLTaxTmGcyxEF80+/wsL0qs=
X-Received: by 2002:a17:903:3bad:b0:2a1:3ade:c351 with SMTP id d9443c01a7336-2a3ee41511cmr54527835ad.2.1767869087543;
        Thu, 08 Jan 2026 02:44:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpc/g1BOPk1bzcN24yJby/XQYHXCB9siaPmfawbd8NIOUuShpU+Y5E6VKaVqh0gWgtqd6Zyw==
X-Received: by 2002:a17:903:3bad:b0:2a1:3ade:c351 with SMTP id d9443c01a7336-2a3ee41511cmr54527605ad.2.1767869087042;
        Thu, 08 Jan 2026 02:44:47 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3ae21sm74364825ad.7.2026.01.08.02.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:44:46 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 08 Jan 2026 18:44:34 +0800
Subject: [PATCH ath-current v2] wifi: ath12k: don't force radio frequency
 check in freq_to_idx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-ath12k-fix-freq-to-idx-v2-1-33c0cca9d93f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJKKX2kC/32OzQ6CMBCEX4X07BK6/OrJ9zAcSmmlUai0hWAI7
 +5KvBm9bDLZmW9mZV45ozw7RStzajbe2IEEHiImOzFcFZiWNMMEc468AhE6jjfQZgHt1AjBkmM
 BkUpdljpFjcgo/HCKLDv4wigDcnJODYHV9OyMD9Y999KZ75YP//iLP3Pg0DRtWhRpVrV5cbbex
 +Mk7tL2fUzn3UqUIuFJ9Z+CWV7RWiGS9ptSb9v2AhgC6nYWAQAA
X-Change-ID: 20251218-ath12k-fix-freq-to-idx-a3cf77f32f22
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f8aa0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AXMgxrcyLYDzoHglUI4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: dL5P1MzLZ21pe86Eobi14b1KLaReWkXq
X-Proofpoint-GUID: dL5P1MzLZ21pe86Eobi14b1KLaReWkXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA3MiBTYWx0ZWRfX1jGdXi+hRbYj
 W4ZUSSmIIk34dJOCaJabu5ufJda5zw/owrp/+sK0E4tuyuelUhi1rGlJdQ9HUnHnR0ddqBV/snD
 WgmEC/CJHT3HbVKERa0cCLoPFNod3dfOlq/kAWDYPqXzjoxZ4oQyzu/bVYnSF2mz6VTSMkI7Gzg
 fxPyUalBd3cWeGsiNFcJeMT14gfumI6y0lWjqc7dOPraceAZrgHUWk/z454kLWhbAV2Hel5eIV9
 Al3zXXzz/fNrS5WeHoQsMRwbN/sAEeMPuJce5gbab9CzkA0vV2+tcrrDQmfylEiPz0MvhCw3O1k
 xPX9/t94vDh9SufqN8SgiW1xAPRzqZ0XgL2STd6Xidf4rAoyFTblPf/oTfL/dcTXKKnX8RBoMTn
 k+x5M6rufIo58uDV94TgW8qFhn8S3tpSTAG1Y4gHmY5sWtiWdCuymzsnHUReCyv7XEQmssgJXOh
 HVwWq4c+bxAlgZgLO1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_024449_935416_574D0863 
X-CRM114-Status: GOOD (  16.54  )
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
Changes in v2:
- change target branch to ath-current from ath-next
- Link to v1: https://lore.kernel.org/r/20260108-ath12k-fix-freq-to-idx-v1-1-b2458cf7aa0d@oss.qualcomm.com
---
 drivers/net/wireless/ath/ath12k/wmi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index be8b2943094f..3ce5fcb0e460 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6575,16 +6575,9 @@ static int freq_to_idx(struct ath12k *ar, int freq)
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
base-commit: dbf8fe85a16a33d6b6bd01f2bc606fc017771465
change-id: 20251218-ath12k-fix-freq-to-idx-a3cf77f32f22

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


