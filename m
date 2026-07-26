Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FA4C531C9
	for <ath12k@archiver.kernel.org>; Sun, 26 Jul 2026 23:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=72mK5vmFBeU3BL53fRubhXr2I1zqsrOqaPq3cLhIFMc=; b=ujs18GG3gnRifDwbpauq/cW/Ge
	2DZjy2XT4tFmUBmeV8nE4ZGKZ2hwxRn6jfjWuAIEg7Gi3T0i4aW5sj4ZMRReE31DaMCDccbJ+cp8r
	7qNUFm8KM7DlA9WO1Ie24MxELKv/Hj8iYPD8JA72X3b5bJqmijjzvhe26kP70e0+klGicDur7ehQl
	wQeK3n8CG0orQnMe2szhD2yUbhyrGFkAz3KJnbAWzE91hp5f2ceXntaXrXYzf0V/5DQckuAUp4A6r
	U4SSr+JUz2zhtsqu4S3IAtOqls7yVDHtXUttNQTVV9JznaoGivk/BPZ0AwKfatq1HYlzOb//Xzyi0
	r0XMp8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo7rM-00000001htz-1F9i;
	Sun, 26 Jul 2026 23:02:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo7rJ-00000001htc-3lCg
	for ath12k@lists.infradead.org;
	Sun, 26 Jul 2026 23:02:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QLrLUl2102886
	for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 23:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=72mK5vmFBeU3BL53fRubhX
	r2I1zqsrOqaPq3cLhIFMc=; b=QgK58Fzhwl3mD+um8QLzbKw3WdGJhHCSs2Scpr
	y7GrsuE+/ybiu2YVSrF1p7q7Zniprfehl2fazHAkyCXAunqJO9ddoWpCrrUFePEg
	/QMVqS13WoDQaYULXVlaQHB25BkOmICgFcl743XOnHAv19O85yj9Ts+A/F3zU3PB
	RqznrzPPTLLR6oBUW+FSWAZ+mh41ltIz+22nfU7vAI0rLANAxSsK/O5k30b3gzFN
	mdZ5ZY5Vu7hqRpygpJNimcy4XzDBOFZv7nCyo+kU7FSnfI+z/pE/jt86nBdBUuju
	yqimOZOn2Q/UE0JnMrni4oyYMjakLLKAlj+2iJc2oUUX0AIQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3sbw29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 23:02:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7621655eso3982051a91.0
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 16:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785106930; x=1785711730; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=72mK5vmFBeU3BL53fRubhXr2I1zqsrOqaPq3cLhIFMc=;
        b=hML7KrNVGDTUXNdzmLIDtK+Bzd2cT4yfR4KapEeVRw7iyFsd7QQ4ysW6tx0Pv5V+vD
         s1fQHM1QZzRFYY78aQ676Lht02hbisjF6fGsXoI+ivHb9//iQS8TGA4C2e3lF9i2oAHX
         W5GTe+qUdOVKTSYZwlES80kYDa9n9nqD1fpRPuLgSQSks9agsw18UBzqaW0SalO8TlBx
         i+MWM357Ay61h5emp0K9dKo3Aaa08vL4rsPInJfm5F8UE4nmCceugXMT2din8XFQIy/7
         qUX+H7e9A9c9acbzpBXZ1jZjAKlIcwCGSxFInCx4RXGUwal3aCpZ6TtxMRnwZp7Y6U0p
         BS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785106930; x=1785711730;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=72mK5vmFBeU3BL53fRubhXr2I1zqsrOqaPq3cLhIFMc=;
        b=PxvdH+Zh4EYooCeYEKD7yyZ+EAFCnUIwCiLWJ9oVPrjFCIBSPDzTT3oEjTahafsxTH
         aCGdiAhS/Ggum62UYAm8OAAanbMuskUrSqjTNE1byfWs8mPfXq5qw98DQvr+GgMGVxkh
         7hzLc+U1/31vCG29dikcRHL32+YTdnEjeiccl7Xfhrxco7+7ZlIZZ78fs/mT++h5lfx2
         Rb/O3McWM5J25FP9InLlk2xjvUGcIqnCp3Em0Ohdk0Hpf5S7G2DF8RZORC3w3JaSk0b2
         qlAp58l+dH8WV846tC0JcBc2UEcomZCQShwrfeCC9IjQEe0d28xz3LTh5kiokRF2uWb6
         kOvg==
X-Gm-Message-State: AOJu0Yw22ZxYjnX4X4pjk5aktTplH87ni49S2icnuCd0lpyJliuLhgpe
	XdPlk4zknff5O/bEOCAntKkFvy2jiP2ZywkqSVdVCrQWA4++nI8+pb3el845Gq9R8Sm3ezf/XfE
	yeZm+lyX3GJqss4f6zYcNRP0yP0OE1QR52c46qCD1B4HWaQVtgK97kU/aaNJrKhR1KfvJxHbD
X-Gm-Gg: AR+sD12dtpRBYfeVeVX/qfKeoVW2ZBbJfuXUBiJ2Yn8UlitAhdJ8yiFDXrx36b/2MJB
	Uw85/drJTAd7rymq2Quye5rwyMbZUkJSpOd9OS09eMkLWaWZ4qsVXCrWoELvhoh+XHMV+hBk6An
	s4NVx5NwFxFSQaPTWkHF3142CWpP0tuxTC7OkE2C7AZgSZ/R3V0qhMxEeoZ0IA6XKq08OEJ5yv/
	P9/QF+ouaOHiX8yd36wr4APTRMEDGvcbCeSNL3vmVF0a5E2DiFQogJ4XH4o8FMcJBetZ3oW1+rA
	MO58nmo8W+4FMdvUUvo93KVzGDH3/M1e9w/NGdTrG/JMEUQtSGegi8Nbt7INcsV+H4KyzFKb0ch
	TJgq6KpDeNQj1joKFlgYX5nCFSyGnV+mDE42RQYG7qjzGWav/j1nBSLw=
X-Received: by 2002:a17:90b:1fc4:b0:38e:7297:a931 with SMTP id 98e67ed59e1d1-38f298a5ffbmr5097919a91.43.1785106930269;
        Sun, 26 Jul 2026 16:02:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc4:b0:38e:7297:a931 with SMTP id 98e67ed59e1d1-38f298a5ffbmr5097900a91.43.1785106929760;
        Sun, 26 Jul 2026 16:02:09 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm34621746eec.25.2026.07.26.16.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 16:02:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 16:02:07 -0700
Subject: [PATCH ath-next] wifi: ath12k: validate TLV length in
 process_tpc_stats()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-ath12k_wmi_process_tpc_stats-len-check-v1-1-c4ba2f84d9c6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO6RZmoC/5WOWw6CMBREt0LutyVtBUS/3IchpJSLbXgUeytiC
 Hu3YQf+TDI5yZzZgNBbJLglG3hcLFk3xSJOCWijpicy28YOksuCXyRnKhgh+/oz2nr2TiNRHWZ
 dU1CB2IAT0wZ1z7CQGtuGX0tRQhybPXZ2PUQPiBtswjVAFYmxFJz/Hg8WcfB/ZYtggjU8z64Cu
 1yfs7sjSl9vNWg3jmkMqPZ9/wGAb6JI7QAAAA==
X-Change-ID: 20260720-ath12k_wmi_process_tpc_stats-len-check-e62cedb09818
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIzMyBTYWx0ZWRfX3rZk1kuiCRoy
 iohkKzZ09yEiOjBggRqy5uuZ1aQotUziwTiolWfSJajr0yUDb6TDjzPLKGyXrXHG9v0C7Y63+Le
 3ZV1uBaAd10UsFO7EacYJHy+TRiC/36BBSucLdZ0fZ+AALGFj15fmr0XAL6cTa58LIxlXXyT0JO
 b9TlZzkjdHxddG4vS4W1wdbSzXgD19DiQpRihSQPgpJR8jKujcjiILSsJpm3kCiJ/XbY/72RbZd
 QsM94bFmSAw0A6u2liVjCA4v0fAMZyilWzIKBedN5RPv28spUjV4xzlNKR6kbmKS6RkAQkUmeKA
 k2qtTB0jUvfhdNsIWqI4MAMzlD3f2AZFqRnVJI9IlGoNiQCBRx8TxDQuZpzWtvn8By3W7p4swR3
 Y3UnjP5NynZZl/dGpA9gHzl2z2XMwJqfDMYI/AqsaIV0J2x05Gu/1Y4oOL8+MKDgJ7KS66U7EpS
 CQwy/gl3avuuM3Hic1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIzMyBTYWx0ZWRfX3mXp53A1dN0q
 mPgBe7B/PsQz0FHGEFtmSOczUft5+v8vRWQVXoyUUqE3wx3LyKD/UlGeLDNa+qmiMVK7wRJ5CeZ
 mIXHoSA7jRd/4rj+k1fdSaObvwIirn4=
X-Proofpoint-ORIG-GUID: 4iVTEn9kjwncHe-j2W78715UMPklFH0f
X-Proofpoint-GUID: 4iVTEn9kjwncHe-j2W78715UMPklFH0f
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a6691f3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZCk0Dni79M2Isg7ApyIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_160213_994861_BAF4FB78 
X-CRM114-Status: GOOD (  11.39  )
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

The outer skb->len guard only confirms the SKB is large enough
to hold the full fixed_param struct, but the TLV's own WMI_TLV_LEN
field is never checked. Firmware advertising a TLV length shorter
than sizeof(*fixed_param) causes reads of pdev_id and event_count
beyond the declared TLV payload.

Add a check that the TLV length is at least sizeof(*fixed_param)
before casting and dereferencing the pointer.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 672eae237ac6..8caafb4cb86c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -9962,6 +9962,7 @@ static void ath12k_wmi_process_tpc_stats(struct ath12k_base *ab,
 	void *ptr = skb->data;
 	struct ath12k *ar;
 	u16 tlv_tag;
+	u16 tlv_len;
 	u32 event_count;
 	int ret;
 
@@ -9977,6 +9978,7 @@ static void ath12k_wmi_process_tpc_stats(struct ath12k_base *ab,
 
 	tlv = (struct wmi_tlv *)ptr;
 	tlv_tag = le32_get_bits(tlv->header, WMI_TLV_TAG);
+	tlv_len = le32_get_bits(tlv->header, WMI_TLV_LEN);
 	ptr += sizeof(*tlv);
 
 	if (tlv_tag != WMI_TAG_HALPHY_CTRL_PATH_EVENT_FIXED_PARAM) {
@@ -9984,6 +9986,12 @@ static void ath12k_wmi_process_tpc_stats(struct ath12k_base *ab,
 		return;
 	}
 
+	if (tlv_len < sizeof(*fixed_param)) {
+		ath12k_warn(ab, "TPC stats fixed param tlv len %u too short\n",
+			    tlv_len);
+		return;
+	}
+
 	fixed_param = (struct ath12k_wmi_pdev_tpc_stats_event_fixed_params *)ptr;
 	rcu_read_lock();
 	ar = ath12k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(fixed_param->pdev_id) + 1);

---
base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
change-id: 20260720-ath12k_wmi_process_tpc_stats-len-check-e62cedb09818


