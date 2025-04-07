Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8DEC36010
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 21:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wRtFH9qTygTaGiFNeyhmWDBRYBZEnxZC4l/kcFqqpoQ=; b=MxeHy3xnjTCWlXDM1IYyodEJmG
	LPBn/YE8FVFmw03tnwYEbnjlHYzCJFrqDZVrbP8BJCgiBt9Cyd9+LoHqDaVZPLPFu7hOkpvuDoucU
	BIPJDd+KwEErIc05ANvSxeM3ey68XoYej4X5w179ccPkncw3gBSRdGZTLNRkRJpOzpPv0Q8qz0tQ1
	q21xOfeXXfNv9aOa1SNqlih96x99WMXsiFbFaGKkXMJnonOCtzMV/gBDqrOdMhoyQv0j4Setdzk4Y
	Jqs58cF+trHParM4DR0N9FlgY+sR0PaKboLP2x/uhBXdv3F8HJkB/i95XXWsIrWsTUDVhzXwHltMx
	S7z7nwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIr-0000000247m-2C6E
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 21:46:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rCx-00000001YT8-0mhp
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 18:28:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537HfMpJ002437
	for <ath12k@lists.infradead.org>; Mon, 7 Apr 2025 18:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wRtFH9qTygTaGiFNeyhmWD
	BRYBZEnxZC4l/kcFqqpoQ=; b=kuH5vU+EYMWqwZR6Efbh0S42A/nGPS25kDBRIE
	dXlEbL+em5TuFVQg7nw7hh9BPS6WLCWNTrH+FOiNcWP1Y/8pWLlFLbLL+qK8g5O+
	fVs4pp1loMy0jIhSB5qRp6DsjrdAJ2qGF7Lm/7Ae4TxI09fHpnaNGTiBsnLv43vZ
	xLIL9A4fPeKyRgMlDKXW29x2tQcMqD1qwIgCi0wnuXLvMtXcOTlTPU7I2Twq7jTl
	5omEOJKJu45BYbu62sds0WnDgHTSQIn05bVO7p1Y6lCG9aCaI5lUQX0I2hcs0xls
	StHOgyrqE7jgZgO3BruXEDgiFlsMEzpcG+5V7+xdDaFaN/DQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtaw66p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 18:28:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff7cf599beso4464434a91.0
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 11:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744050509; x=1744655309;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRtFH9qTygTaGiFNeyhmWDBRYBZEnxZC4l/kcFqqpoQ=;
        b=sX0U0L+Otv1i1BkThWRSC9jTuNomxyagLhETQoyL5iPWpBDtRl7L2MjCbCxyDKqWoa
         kwfUaOKJrR/ecBXIPMlr9KBsu0EXXLBuaNfojnGJbdtaf8D6EuvrKzEFw/sVjQvjmWfg
         I/2v80dLlZOlE7aTiyuhwsYChtEme/FFDBu6p+PDT3WZbF72EMsXTsR2mQaj9TnbqyzL
         zn7m2R9JdGRoP+p0jEpZfasYdl0A3rPV9yhrdlHJcY86mZnuwYFDwhs79Ado9VShESSA
         IOLeeQUEuD9s+koO2roCJJ78kkPhzQThGFjDuYREJH8iXOTv3oZBHyaAlxEQ25//86r1
         JFwA==
X-Forwarded-Encrypted: i=1; AJvYcCUJPHBuWST3LGdFEKtHXucGwxqshgMqfAVYytInhuSXLzU/Tofv/SzKK+gpY7FrgIVnEG7QsdI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIgP2TW7ZvAjwL1Fxkzdc11iFSqz9dGUo/xxEntFY0KRfGKE1d
	NQ+/SCCLZGW3YbOxpcnn6w3GH6LFYuy9wQKzfEzbY3PyxWjn2oYtqF3W9YYce4vKCgJlTwYaxl+
	/Eqs9wV5TrnV5KRWDJiruNTSAtWgdX5C3jiVP2MVDjxdldO5GM+/9rvfGFxn3
X-Gm-Gg: ASbGncuN812/nYbXR7I8O6qr782UBKOYwo3111pVKOjai1mzBoHHo4DjuosxfoAyQC5
	CxVg6W2s4UMJz3E3ZabOiTYgrpbyFyRU5zSoZQJb9eYC5z90oyU0GNVD6Biw79a3TpRUyKUKAfF
	DvodON/Mg7G39FplTVz1mvK9OqWqUT0A9l9oGtxg0g68y6xhZZcLmYAKRxxSThf6IRqPb6PQgH0
	LdVF5WSVt5BHMOeAXp/VIKC8MzKXkgKK0xXzAiqbRlYgoX+odurz8BjZ3WeJkK/uCUFe/5KNhSK
	5Uynxm0zK+pdSWwsQ5kaOguyN2SqK+ZxV+oy+NxySA5OsGTuXte4
X-Received: by 2002:a17:90b:2d87:b0:305:5f2c:c577 with SMTP id 98e67ed59e1d1-306af6eaa6fmr12257116a91.3.1744050509440;
        Mon, 07 Apr 2025 11:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIkUUFJJbz5/DUqQ15ZO3tVB8cccmjhRILJ6c9sC2XH5uCBz5Q6S4AWzXEYCb3NL0aVsUrzg==
X-Received: by 2002:a17:90b:2d87:b0:305:5f2c:c577 with SMTP id 98e67ed59e1d1-306af6eaa6fmr12257085a91.3.1744050509015;
        Mon, 07 Apr 2025 11:28:29 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a30974sm9181431a91.25.2025.04.07.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:28:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 11:28:26 -0700
Subject: [PATCH] wifi: ath12k: Fix misspelling "upto" in dp.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-upto-v1-1-23ca65f2ccdf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEkZ9GcC/x3MQQ7CIBCF4auQWTsJpSixV2lcTHGUWQgEqjEh3
 F3q8kv+9xpULsIVFtWg8EeqpDgwnRT4QPHJKPdhMNqctdUO33lPSO5ir2421s0WRpoLP+T7v1l
 vwxtVxq1Q9OEY0x7wRRKh9x+O6w5hcQAAAA==
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: AWil9O5kZ0IRnCDu0jNLWE-4fAfL_-NK
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f4194e cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=UkFjiLiVbqrHbZXL8LAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: AWil9O5kZ0IRnCDu0jNLWE-4fAfL_-NK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=970 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_112831_248335_35BB7AA4 
X-CRM114-Status: GOOD (  14.63  )
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

ath12k-check is flagging:

drivers/net/wireless/ath/ath12k/dp.c:1656: 'upto' may be misspelled - perhaps 'up to'?

Replace "upto" with "up to" and split the comment line so that it
doesn't exceed 80 columns.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
To be honest, I saw this when I was processing the original patch, but
I thought this was just in the commit text and let it slide. But now
that I see it is in the code, I'm fixing it.
---
 drivers/net/wireless/ath/ath12k/dp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 80b9f4594dee..59f61341383a 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1653,7 +1653,8 @@ static int ath12k_dp_reoq_lut_setup(struct ath12k_base *ab)
 
 	/* Bits in the register have address [39:8] LUT base address to be
 	 * allocated such that LSBs are assumed to be zero. Also, current
-	 * design supports paddr upto 4 GB max hence it fits in 32 bit register only
+	 * design supports paddr up to 4 GB max hence it fits in 32 bit
+	 * register only
 	 */
 
 	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG + HAL_REO1_QDESC_LUT_BASE0(ab),

---
base-commit: 4bcceba241524d8d52bdadf216f9f894e394fcde
change-id: 20250407-upto-a76497324734


