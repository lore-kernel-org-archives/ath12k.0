Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA73C77B7F
	for <ath12k@archiver.kernel.org>; Thu, 26 Jun 2025 05:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6pAx5/ZkLCjLuDmzrc9YzjagLIhF1++aZj4s/ojWJSs=; b=FIGQy+Eeha+pdzUyD9dLN7zvlo
	b73h9lNMUVaieXjP06loKpGnOgXxMMOAOls8W5acxfr4nvCsHAOKWjGCk7Mv7dSuracQ4LDqtrvKn
	zoKZ3AvzqTOYuDXys9RXyCLCna739slyeyczP+YXqbXYgMjbjTd0l5s90NfRX27Yr7lODcQ2Y2b//
	8kv3hieKNvZ4uIlX2jD1JAyIROMC51E3a7OWPs0/8S7/mdNk3gK2cCeYfCJUdIUlkuE1m4lNDkJ5e
	qP5hXwmQUbeYZZKRvoR4poxapCQZEZa0SyvwsQjEI4GRT3lpheFOZiAaPcvtYWcEUxJK445dUcPuz
	BGDNRfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUf2B-0000000AdP6-3yUR;
	Thu, 26 Jun 2025 05:20:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUf28-0000000AdO8-2XOL
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 05:20:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DmWd015328
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 05:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6pAx5/ZkLCjLuDmzrc9Yzj
	agLIhF1++aZj4s/ojWJSs=; b=b4AzxaZbRb2WLrMUh4SQhZq38y6W45cka69ETY
	xqOUxEtwBDGc5dRzpGJqSZ6WjjM5MlOKJQrgmBsOHkM4pV0/yziS7zzS3aY/r9Ku
	T0NTc7lgWFPjbOLjoSPPmBQPAy6CnJ5W+aGerDSkp4Rg9+WQjF6QZlt1pb0VVpUX
	BxAjphrN5SE6goz6tmbIC+sL7tPYen82fQzDVXFzlBcloffdR9EswzH5tYL8G88l
	2bUl5vkx4iGkWSaUOnAmlHuOq/0yN62cOyJqEZ8Jrtl07zH0f8J8DwIza2Ect9HT
	2qx/eaohsM6N3p+L+oSy+JIJeJQjtYG2f2FLuAUPTAC4pV4w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fbt8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 05:20:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so556993a91.2
        for <ath12k@lists.infradead.org>; Wed, 25 Jun 2025 22:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750915214; x=1751520014;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pAx5/ZkLCjLuDmzrc9YzjagLIhF1++aZj4s/ojWJSs=;
        b=rUdOP73Xf/Ft037YH7qByXe2w/0b1GnZwFhdrI0/MWF8BJSRWyxxj8OR5Qy4OnRpdk
         1xyQ6A/sFa6KDuUkV39BIv8pdjV2+4e1z2a+ehTfi0KzuxHquDMmGKZSnm439SjymBOf
         /sVK8GvKwD5KkZwoHGP4NaeRmVdh8OCI16wko91ZoNnKj9jUsXRle05Z3XZMYktDglJC
         dQY+vAH/uJo8WAC0qEZ1cdevCTapxUeFpCWMUcbIytO9lhV1j4h/jloMVi8ApoiueMrQ
         D+Dq4PyPzEqxfgjFyRqw0u46BKU2O9bXUw+o85cWDOvQVLPJ/foeEakktoNS8IC1pVkz
         MWHA==
X-Forwarded-Encrypted: i=1; AJvYcCW/MRt7jBbAOszFdGaSttePtNXjIsRQOazw18Zw1ZxdKoaSMZK2rpFlbjhatU0NAzaWtH1GL5s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgUsrRanvu76OPjzdVthwWGrjFJVsQZleKy84/GlKLe1dw4FcD
	ThYwuTBpJ2tXOgEpPZMyf80hVKpolOxEXbSFX8v9MLYNEVdKj3y7mCOzrvCirEOkqxYKZlfr8c1
	YqXWWfsJljCfIGlrNzuiCh3SuHnkqyMun9XChsFP5FmUtpiqhUKQDP8TOtInu2B7+xrerCDWM
X-Gm-Gg: ASbGncsDK4JeR9zTxWn7EVOvtZf60uVB487eIlzZSgzhhl3nVgFZZSyfH32uUJkHSsj
	8CBNRSPSfOJ/nKEbOjmV9m9wAW/wFBYcDY7LQJHvJdpZuK9Dxz2bWYYL0rEfFltx2YSB6cF9R3R
	rGR7vIMPW11nNdzhjrIjMEu6ep6K0aW45lsOnDrJwfD0PlO8OTXXFumB9O29E4GZOf5GhWkUv9M
	m7DubFeq1TPywqHwQq3lGH/TA128FMNcCucqBHMtHRf0Juw30BT/XkEX6d39vVwzwVlAAFgokHB
	hYcSVtWbTNUktHzfyCvt4FhUazIvwhH7FuwRxqpBg4HqjF68/jZTJxTEMR5shVwIT/OtUSLpMqj
	xCPJwR6sBSxFxcpI/AHrJJonycS7eKMyaKnX1mxvs9tyKVe0=
X-Received: by 2002:a17:90b:2ed0:b0:312:def0:e2dc with SMTP id 98e67ed59e1d1-315f25c9b3fmr8638728a91.7.1750915214189;
        Wed, 25 Jun 2025 22:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH89OoOzXSimx5HnW6QRCbmh5jHDwsaTiPcchec/GXWmTxIjZHrwzQ00PiGT6UVndyuC4fweA==
X-Received: by 2002:a17:90b:2ed0:b0:312:def0:e2dc with SMTP id 98e67ed59e1d1-315f25c9b3fmr8638690a91.7.1750915213684;
        Wed, 25 Jun 2025 22:20:13 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53c2f28sm3443612a91.28.2025.06.25.22.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:20:13 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 10:49:56 +0530
Subject: [PATCH ath-current] wifi: ath12k: fix timeout while waiting for
 regulatory update during interface creation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-fix_timeout_during_interface_creation-v1-1-90a7fdc222d4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHvYXGgC/5VOSwqDMBC9isy6EX+x2lXvUSSEZNSBmrSTKC3i3
 Ru8QTcPHu+7Q0AmDHDLdmDcKJB3iZSXDMys3YSCbOJQFZUs2kqKkT4q0oJ+jcquTG5S5CLyqA0
 qw6hjahAam6ozV1u3XQOp68WYgufOA3SchVmZ0UUYkjhTiJ6/54etPC1/zm2lKIWUdW/7pu4M2
 rsPIX+v+mn8suQJYDiO4wfwV0FB7gAAAA==
X-Change-ID: 20250625-fix_timeout_during_interface_creation-ae428c7d3684
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA0MSBTYWx0ZWRfXzSEaUbZHb+3j
 Zfx6d/mmx89LvpVPhqoqUjAnGbuAFdjHfn3+1yw+U9gzlYmIGEiqLBimRyoD1khDmF6uCz80if1
 M7im1O+Js4+W84YUA1Gr1QVzfwuaNRh41TU4jSbaTNFLF2uY3lTx6TJ5zd6FkbGYlYfbwYQSMv2
 KY7Lu2z63P36p+OkdOWF2r9PgSEWdgOSfkcZpgcuUA9sxgwzM24iMbf5LIXVuSflDJtJyG7SZrb
 wU4uxhkdaRgy0DKOr6TR5+8KOPff8lKxqR65zf24RrEFlSShXEr+7mtVyqpA4U2qaA1wQGSNufy
 pGbN7k+qUy0XWpw50pSwhh6F1zUJIS7U4roGaYwU3Acepan+itW0yV93RZ0Bmq6p7Gfolz6p7rL
 VMuHK8H7lbJ2ycMBUIpv2UVr39o7VInRRHKLxlBnBClfcbxW4u2OF79Ma5YYEsxA8wTjzN9P
X-Proofpoint-ORIG-GUID: aAbN0ylE53a81avQkO0uLEtd7MbS7VNi
X-Proofpoint-GUID: aAbN0ylE53a81avQkO0uLEtd7MbS7VNi
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685cd896 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=JrXYcSkjSHDmVXoFp08A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_222024_771514_F041429A 
X-CRM114-Status: GOOD (  17.76  )
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

During interface creation, following print is observed on the console -

  Timeout while waiting for regulatory update

This occurs due to commit 906619a00967 ("wifi: ath12k: handle regulatory
hints during mac registration"), which introduced a completion mechanism to
synchronize the regulatory update process. The intent behind this change is
to coordinate the timing between when the firmware sends regulatory data to
the driver and when the driver processes that data.

However, during interface addition, if the 6 GHz band is active, the driver
invokes ath12k_regd_update() to apply the appropriate 6 GHz power mode
regulatory settings. At this point, there is no interaction with the
firmware, so the completion object is not reinitialized. As a result,
wait_for_completion() eventually times out, leading to the observed error
log message.

Hence to fix this, move all complete() on regd_update_completed to
complete_all().

The complete() function signals only once, causing any subsequent waits
without reinitialization to timeout. In this scenario, since waiting is
unnecessary, complete_all() can be used instead, ensuring that subsequent
calls to wait without reinitialization will simply bail out and not
actually wait. This approach is ideal because if the firmware is not
involved, there is no need to wait for the completion event. However, if
the firmware is involved, it is guaranteed that the completion will be
reinitialized, and thus, it would wait.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 906619a00967 ("wifi: ath12k: handle regulatory hints during mac registration")
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 2 +-
 drivers/net/wireless/ath/ath12k/wmi.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 83caba3104d6c0bca40dd1166de335aabc8b74e5..ffc19a6b948539dddf3f6f21f2799f1b661347f7 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1475,7 +1475,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			complete(&ar->vdev_setup_done);
 			complete(&ar->vdev_delete_done);
 			complete(&ar->bss_survey_done);
-			complete(&ar->regd_update_completed);
+			complete_all(&ar->regd_update_completed);
 
 			wake_up(&ar->dp.tx_empty_waitq);
 			idr_for_each(&ar->txmgmt_idr,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 32519666632d1877eb48a31e94e5eb47f2b33880..d5f41f0fceee23710d2d775bb4d6f7451e15a55b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12755,7 +12755,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	 * proceeding with registration.
 	 */
 	for_each_ar(ah, ar, i)
-		complete(&ar->regd_update_completed);
+		complete_all(&ar->regd_update_completed);
 
 	ret = ieee80211_register_hw(hw);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index b38f22118d732aa182f9fd6dda376b0d41de65e2..2fb262d13a586bbf354a74be8e509df2b4905f30 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6764,7 +6764,7 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 	 * before registering the hardware.
 	 */
 	if (ar)
-		complete(&ar->regd_update_completed);
+		complete_all(&ar->regd_update_completed);
 
 	return ret;
 }

---
base-commit: aa555da8266715e52e5dd74360f3b4c866ddcb64
change-id: 20250625-fix_timeout_during_interface_creation-ae428c7d3684


