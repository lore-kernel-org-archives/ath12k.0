Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D404F364B2
	for <ath12k@archiver.kernel.org>; Thu,  9 Apr 2026 18:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fm03BrLOH8durwa3lCWW54gnX/Tgar9SDSS7/SegCVk=; b=0yjB7bbMQ3185fYdmm3zn9c0gq
	PFIuC9hy7YBE6oS6c2zQg9a2a42SQ9K9XfCqd1QPWQKmHq+UXsULu0M8wfIn1lg4s1zRekVMJPqFW
	nifijmdwYzBu3ysxcIPbOLJX3sOUpINtnPlR2EY87squnwDLzLD+Eaj7dn/iYV5irX6jB/db71o00
	CXS2Dywrr8xaLkpNDPGgZ0b3zXIAbq3NKno/FbMkiR5vcq5EGCApGbduGb763TN6bVpJyiFh+YWJ/
	WISDXDMr93aK1bv6BOTMDlZA0ueITchJhDSzFgZYkk+jmpW+dWexepmIwEIQ7GFUHizEhNuRX62XP
	FoKt6Ybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuMi-0000000B6lY-41SP;
	Thu, 09 Apr 2026 18:44:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuMf-0000000B6kE-3rDS
	for ath12k@lists.infradead.org;
	Thu, 09 Apr 2026 18:44:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1sDC2624720
	for <ath12k@lists.infradead.org>; Thu, 9 Apr 2026 18:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fm03BrLOH8durwa3lCWW54gnX/Tgar9SDSS7/SegCVk=; b=MVhCmE63iWJLbGqe
	bHISkbq/tW6kZRh5ymI2Oq29KHzNl0rQrXZwjEU3C7RTqurUA7XuHK6F3hq5XfBQ
	y4W7K/vE+jHkPZktTh50ueBMrMYtFR5mVJx6ihsZGkP1lFr2/l/y624V4Ypt5vor
	ifLGgsGx4DCRXSgWRjOr3AaJ9AsW5W38IAaflQPvrP02WKxt0wBnsuHjEZNt14v9
	poc/esklxWH9d8MyZy4EiDV2sZeqW08n4MBfazpaRtqglsb3n9BcihzEnHmn56/s
	2hnJnWQw49RYMmmhm5ytOsSaF5f38WKnr8YEqK95+5vaPCIcij6woito7Ht1PcQu
	k9zy5A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu19k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 18:44:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c21dbc9c1so4871976c88.0
        for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775760268; x=1776365068; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fm03BrLOH8durwa3lCWW54gnX/Tgar9SDSS7/SegCVk=;
        b=bOuua2GVTGfuJSRev2GrVGu3z0DbpjSI0sV7e68G5zIdxYhmYiXhK/hDzMDxv5VDdi
         mjVgQZWtcHkivtJW8Bb7RYXAFTOSiJWU7XHxQnOpLZx96/6a1oC/DXG/Q6J6phgmEEjq
         6yisg3DVR44bSWtjRiWOyDScu69N4McVSI9gzUdGtEsTvyN5lGB3KWv38lA/T8CamACE
         EdyPB1W/l7uAlu+j96bS8Tn8WHmDFyTevntDI0FizDiqqzgITBeHIppftX8kwRMA3RX7
         eqvlj7a+cVzOwwz3Qmjz388N5X9cc/GdXPR+wyw+UVsgQ6++ishpvaLtB9hMTOznZnyx
         7y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775760268; x=1776365068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fm03BrLOH8durwa3lCWW54gnX/Tgar9SDSS7/SegCVk=;
        b=PfHf2qB2pn51ProXmHNkmLwxLkU5TG3Qz3XXIXC74g+ImWVBhVBPELRwnOQ/Rg0SuE
         QhIZqglk8vEewU/Pr67j48OektdJVDRVoKhSuHwlmIMxyZGFZX3AWhe1P1CwDzjAl7Qf
         sYkva4OOZmDxNQHcra2SwAEZP5qVpuKnyKCMwJYxZL0yZWRRWuE0L8uxZ6wgq893YPpS
         8PfuKHSJe5VF+rWV7XDhSSaBaqJlXfndV5rS79zk+WQO0CAR+8Vmua2HlArGxjrxY3Lf
         v4YK5a11uxva60hoajC6p3MDzOm9q62URg4Envc9CS39bx2rpm2rqPjvGqWxWHT1Wzqk
         o5WA==
X-Forwarded-Encrypted: i=1; AJvYcCWqIAKEIGgLgF2SL5cWLaJJSVzjT5tuBSofqLyqp7nBBE8FmdwfzD+Hh9cNjVhZhJ0lmkytnt0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJDCIkXZ2oqX8JEMmCtfsgn7bKQaBWiyVzVy0+O8it4rCVZXNK
	cXDvaf7UXqQRmwU9SAkobSzUJVuQiIFeURsgFp+atknqa3HbeB1p9mrRUsHKEAYg6oMIvN1bhfc
	V6dH750ClbXwblft7zlKg3Tkpp3kK8e/nY6ZM4giOtwByGZjNO2omZDU2+ISjkMO6
X-Gm-Gg: AeBDies+lgJ17RF3CjIJRRIQ+AyB3zyYzRKh2S/AvYUl990hFeemHdCVlgJa7mj4rzd
	vGGh7fe7faIe7l9YGvKSfV5JOfAke5kqDCUSkGuDahmZRv0xQk0jA4glCyFouyZL1AZ3J/OWJN2
	7qA3ld8AgIAvwfOxVLPbu5kX155LqIHLKsgILIatxVeIdBJS/TZLqaV8pJ18ilK7QS2HJuZ5XUS
	Tkjb+s0mhwGRAWvDQPX/zE8TL6aRxzvgAXzy35xCYcpIjERhd/EJriR0kowg7lzOppjuGoAlANE
	tQ0vfAwu4uCFq0BdXYCAHesCX10AWQWGZPJ7v3wjsnKUCX1wxKMnwmPVdizAdbSdncEH+3e+PbK
	r5cnQGxcJuDYi4Nsy/HSIfVHGNTJ2ANtaidHGHl231hySBWsn78pFkM4AZeA7lVzVkpadwiqahZ
	Xi
X-Received: by 2002:a05:7022:6183:b0:11b:1c7e:27d0 with SMTP id a92af1059eb24-12c34dbeaddmr166181c88.0.1775760267984;
        Thu, 09 Apr 2026 11:44:27 -0700 (PDT)
X-Received: by 2002:a05:7022:6183:b0:11b:1c7e:27d0 with SMTP id a92af1059eb24-12c34dbeaddmr166158c88.0.1775760267419;
        Thu, 09 Apr 2026 11:44:27 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c34352490sm513985c88.0.2026.04.09.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:44:27 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 11:44:24 -0700
Subject: [PATCH ath-next 2/2] wifi: ath12k: Fix ath12k_dp_htt_tlv_iter()'s
 iter() signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-ath12k-htc-proto-v1-2-cda86d6355f1@oss.qualcomm.com>
References: <20260409-ath12k-htc-proto-v1-0-cda86d6355f1@oss.qualcomm.com>
In-Reply-To: <20260409-ath12k-htc-proto-v1-0-cda86d6355f1@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: eRxdOjB4PuKC_RSD1Q1820bcOJ_COojG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE3MSBTYWx0ZWRfX1OsoBSVwAMSA
 8oIq1DPPVoL8W1XplGFMSGIgvFEGwhl6C9RcjOZPMX8g4piACIh3cMVMDlCTDIzNn5vutFPS3P/
 MpHBG9ixYDtnDmSowsP/qa2e5w3Y+adifZOjPE6FNm10g0CwI99C5AfN1MWrcAHtRZCrYfpK0Hl
 b24Mt7j97NK4dqeTdTr6DfYt+KIkb4zDu7FxssuLL7cpwx+Gs/aszGNHGD4JdOQ5rs8Z4G5PGx3
 J3G23oEmVengA4PmSlO82dT+nXx8vLIg9iRU9fVBhge/CGxptTrD9wlGhabuVL0eFS7oqUI/ggQ
 BqaHPoVO/oe2HAebTs6uBdL/9wvFz6pyycYICCV+trDVlzUQC+G1iTzowj/mdpnN63XzGNKAbJ+
 k0zbblS9qzhAbEtCgtSkqZSGznXpIJ+8Df4jAGkePv40Co7I9r0iT6duzsV8hsQfcgdXblEcjrA
 fx4JicVKrm7eCSBHdhw==
X-Proofpoint-ORIG-GUID: eRxdOjB4PuKC_RSD1Q1820bcOJ_COojG
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d7f38c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TfkjnaP5MeWC5N93_1wA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_114430_077786_D2822239 
X-CRM114-Status: GOOD (  12.73  )
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

Per ath12k convention, a pointer to struct ath12k_base should be named
'ab'. However, the current signature of the 'iter' parameter of
ath12k_dp_htt_tlv_iter() uses 'ar'. Change it to use 'ab'.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c | 2 +-
 drivers/net/wireless/ath/ath12k/dp_htt.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 9c19d9707abf..52e10059c6d5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -146,7 +146,7 @@ static int ath12k_htt_tlv_ppdu_stats_parse(struct ath12k_base *ab,
 }
 
 int ath12k_dp_htt_tlv_iter(struct ath12k_base *ab, const void *ptr, size_t len,
-			   int (*iter)(struct ath12k_base *ar, u16 tag, u16 len,
+			   int (*iter)(struct ath12k_base *ab, u16 tag, u16 len,
 				       const void *ptr, void *data),
 			   void *data)
 {
diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.h b/drivers/net/wireless/ath/ath12k/dp_htt.h
index 6020e632f74e..987689f11cda 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.h
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.h
@@ -1523,7 +1523,7 @@ int ath12k_dp_tx_htt_srng_setup(struct ath12k_base *ab, u32 ring_id,
 void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
 				       struct sk_buff *skb);
 int ath12k_dp_htt_tlv_iter(struct ath12k_base *ab, const void *ptr, size_t len,
-			   int (*iter)(struct ath12k_base *ar, u16 tag, u16 len,
+			   int (*iter)(struct ath12k_base *ab, u16 tag, u16 len,
 				       const void *ptr, void *data),
 				       void *data);
 int ath12k_dp_tx_htt_h2t_ver_req_msg(struct ath12k_base *ab);

-- 
2.43.0


