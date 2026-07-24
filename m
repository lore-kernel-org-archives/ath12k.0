Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67343C531CC
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 01:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Hw0owkOH+6wN9DcwjzLX3Ffn+1YguIY8Zhaj18HcfE=; b=X8QId9Pq8QRFvw
	Qfi2NQdeUhuNwSXSqcsqACrSwvTf0GBbAjgW0BOb8H91t+4DX+Z+2zMRLYkhAPbLmPf/ljHxvTLSR
	vA+bpQHecAnGOhqqUp4qBFAW1JAC1/ge51YM1s8j7BXG/aQjltw0DGogDqKX0Ogx+vfnvQFBx1aEC
	yVhg1xxK3WcNKUbLX3sxL/npMIItHkxpU/semzkGWfEVxH+7rtD11qBm9L6D8kt1/d9WEEPQ7ESLZ
	Nm27h6hK40YibbZjSp2ngWXnKukaj3LuY8ggIOQsz7uO9VeSC0zLlxkhxGMHhocYbSCizPMT6ph9I
	Xr5QVl1/auKj5XOFAjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lD-0000000FL9u-1KsM;
	Fri, 24 Jul 2026 01:31:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lA-0000000FL8F-0w4N
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 01:31:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeOAW1201998
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1Hw0owkOH+6wN9DcwjzLX3
	Ffn+1YguIY8Zhaj18HcfE=; b=KkNLG8k8HmiBUaenP1Mdnd3dCrp88GZ3RtBpht
	o1JOycBlAema3wXCdGSbjF2OEBERyTwcNFCc5QJDUF+3ikCt1Aw9EM3cl5hxKlSr
	S1kfcI1nsMP0OkJiglJpeoxJQF/AUg8Kv0Bcg1zWm2rNc63QCPIT6dbRwiimZQgR
	8HzfQIGuyFTRIbFA0m4CX4tusdP+GNaJOUvG6BQgVWNAEbaKEv8eUS/pBIeaSXbB
	WqvSp/pDT/oNHXFzyaJApGWG06kQYuOLeODfmBybu+tK+2AYPPwvNcJzt/3cREHv
	9GQ7P+0M7oomLPup5nBHLNLLm5UpQz5OGAo7eCoNStrqR9Bg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamsg3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so937583a12.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 18:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784856690; x=1785461490; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Hw0owkOH+6wN9DcwjzLX3Ffn+1YguIY8Zhaj18HcfE=;
        b=ASXZVuZtgGqU3YEn2/kl6s90LFMAqDLMHu/pt7Y5UcIXuAaT57xwIdtJNQGTI2gvPo
         oCIyTEcY/c8BtsWlLqAA+3JdOgzFeyv5XrC0HheKLcHerTOiIbymXaIrjszbwwur5LWj
         Nh6s+ayGR8exa3wAooUw+zyllT6rF2EfEx3BGHi2VaYONkCE7P0u5kLBtdWpSh/dsWMq
         AcP77R5pK1QfMGtyCJH+2kolBS44mr0taftaeTCKipzU+u5tCC7lHbuvIS3I3N0eXNZe
         7W7wqZR8JR8PMYY5p1GrjqC7t/C6MnmgAmvYcPXWwYgy9XSv03qxqjRigRM3bKWMdypm
         pZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784856690; x=1785461490;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Hw0owkOH+6wN9DcwjzLX3Ffn+1YguIY8Zhaj18HcfE=;
        b=QsQ2doyBW5y9WKYpF8JlErbj5xTC0n210m/xioyX0aS0E3Nb28ozJBaZNHX+FmJ/vP
         E0K58FTWLsysWngkOPWyFhzf61FLHD3o6CPbm56LVriMCymEda+8O4u3E57YoOo/K9xp
         nx4b95dvSioMAEJGYdN+XNKEJi2kbb3odANOXMgoWAThVSgQOZh8pp2fUmSZPm2JrvVa
         uMsgZ5UYdmkNBg6D3LhL15Kp/Q+wAuBndp6Cv0rPt+IvoxNI7fwIQU7oQ6V4MGQDCh6r
         0tiWNILwYvm6669V3CjQ2/5qxWA8bB6UDjGwG4WRtKniVMlolh8y6lyT3RgLVWnUCMYO
         tPiA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8a10kcaeE0Jn8Qbq/cWtBvabQwl6rzsXM7+zxMA8zY5pD6TRB4n2MdMLj0n+YCSBWGV/k9Xw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSXSMVOkqIKCrwITjrSAPbHCYKzuDzjlXwKpEVHn0gQJA+O69i
	TRuRDCH2/cFyomIdNuTJSNdSiZ2266L11+FF5qJvgFT0dG2WQxxaqkej/cXfa9KXPPbhCelogWO
	83bPBZWgyj6jdyZyDybQ5e9bfgt2xFUmey8ZGnx8GcKS9rq4dPUcF1fGrMb85dDLx
X-Gm-Gg: AR+sD13V1+LzLV5bGvD7TnP/Zr0AsfgcCbbVtGmNUA/HJdVFDySYoYePa9FOXyGl2gj
	fVBbFOCa0plX658p4BWLjaG8vI1hyg/cmCUpIMkfKz1Cr+AqrI73CtnIciroIaIy3y0WMEZWkc2
	GNW/ZCt7ksPoEY1s6P0cvLw6XOSZdWfVPVAuYxobwPykbW2eLW5WMyPk8B8xuvV1Dz/B6bxz2+z
	0ladvGxMSIiZucv/gJAP3qx7mYlDvKsrMHvKmmTU841nbL28hV8ZWjgSxkT1z4k2zPJ+N49P505
	VGuER71dhJrmxyu3tbMBb1n7E/oyh/eUMqJEDyTQFpfcz1+rT6XduUchea52+lYz8n6NMi0OdhR
	+XWCkDF6qI9wC/44a8GXlOe231aJvFZYLFLWYTQUyN9OcIEQubH40caQ=
X-Received: by 2002:a05:6a21:a395:b0:3c3:b57b:628f with SMTP id adf61e73a8af0-3c44b14e867mr6229638637.48.1784856689999;
        Thu, 23 Jul 2026 18:31:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:a395:b0:3c3:b57b:628f with SMTP id adf61e73a8af0-3c44b14e867mr6229605637.48.1784856689553;
        Thu, 23 Jul 2026 18:31:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df0ba0asm22655306eec.18.2026.07.23.18.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:31:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath: Fix buffer overreads in CSA switch
 count event processing
Date: Thu, 23 Jul 2026 18:31:23 -0700
Message-Id: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvAYmoC/6XOQQ7CIBAF0KsY1mIAtVRX3sMYQmFqiS1UhqLG9
 O6Srt11M8nPT/6bL0GIDpCcN18SITt0wZfAtxtiOu3vQJ0tmQgmKiZ5RXXquHio1+DUGIMBRGV
 QK3y5ZDplwuSTggw+UdOD9tNIZdvwE2+klXZPyu4YoXXvxbySMkc9vBO5laZzmEL8LM9kvvQr3
 Mwpo7ZitWFS15XUl4C4e066N2EYduUsaBarIVGg5qBt3cIRBNR/oHmef4bU9HFsAQAA
X-Change-ID: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAxMSBTYWx0ZWRfX/CnPEGjv/Kf7
 WRN0LCcYuUYBfKtSPOrr/LAoDXcaHdReIsLWjh28ctIMkRL236aT/Yf9E5awYoJ5sciMuLXKGm4
 GDp4eEZBx7sJrMXInLRgKgk5Q5+OlcM88B61qEoVpkJenXP3kRKkASVnk3a6tksHpHKez9/IHel
 xA/7+F224TCFOqdR8t9rUdk8En4/iAlrik82m4w2j/YGc3dcPPRmy+8hr2SCJpx7j+36eFwW/By
 SHa5JzNp5jnZLcILw5M/4D6QAoKxMB06m8wmawG0SVXzompXJ9dzqiCsQ7rxNW9/noe5y1uer77
 r3uX0CYEvW86Ls2unUAuy+94YDRp2n8ep9VoSpJFPsqGSWYLkYTT8XUPPMd+m5rVJgva5pZhX+3
 D40IkjzWt8wbppA5I8Xe9WKyI5HKuzyy53ir/cgue5GG/CGVs1r1qRSxDoNlo2Jnc2bhiGnsGhc
 SjRPXjXIMy7f2S0789A==
X-Proofpoint-GUID: qBRXGqiB5Mqy67h1rf1gNxPYwn3Hrf7t
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a62c072 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=0Wn3t2srTQlYvQ7pRnsA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAxMSBTYWx0ZWRfX6QC+14jkKb4+
 rV1sWjpCxruiwUlv9wiWmygtv0S/m5KGKe3jDybTF6M5l3R72XDw2qIbSNofPFeOWbGtCyzUP4U
 q2BGFmvlD+To6HwZ1unviVvBqtxlpUE=
X-Proofpoint-ORIG-GUID: qBRXGqiB5Mqy67h1rf1gNxPYwn3Hrf7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_183133_290185_AA57DC54 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

Both ath11k and ath12k fail to properly sanitize the CSA switch count
event.

---
Jeff Johnson (2):
      wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
      wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()

 drivers/net/wireless/ath/ath11k/wmi.c | 21 +++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.c | 16 ++++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: 0ceb105245b5e57f803bdc0e79dc077fc06ff384
change-id: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3


