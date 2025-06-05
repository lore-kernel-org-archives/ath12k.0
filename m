Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12481C5B552
	for <ath12k@archiver.kernel.org>; Thu,  5 Jun 2025 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3xm6VfkW3b6R38nakzaF1bbb+wxJ3bDtlf6fYnH8p0s=; b=tsZhfx/ZjL+UOqfLtGx0en2y7J
	SXIkUlIZlQmFf1SuHBpNLOvxlDOB/fpTairpKxft9/RH1Xu6LFrs1D5+6tYxS0zyAHBR6ohvqh8gC
	zuvPBoaywIo8khXVYXop8fNLk1TPOTe91taPoYloH/fshmt2dB5QUfgoGKvXNc/puSURdzTyueslI
	BkPWSQfx7RvSkK1GOg6h/Ft59aTYtMGQ3RTlFoOZNX1914ce7C4h1ESd3DZBUhnqh2mLTNIwkKYo9
	xGT2bfBfyPwfQkR1rL6Msr4WP3TrMwgTNjR1N03dy/RX2fCUWvyMozSQn11+g+XbvaZMdqeL+4JEz
	iyFScuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNENI-0000000G94o-3JIY;
	Thu, 05 Jun 2025 17:27:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNENF-0000000G93r-30zw
	for ath12k@lists.infradead.org;
	Thu, 05 Jun 2025 17:27:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555H1Bop027543
	for <ath12k@lists.infradead.org>; Thu, 5 Jun 2025 17:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3xm6VfkW3b6R38nakzaF1b
	bb+wxJ3bDtlf6fYnH8p0s=; b=mAN+pzXTJGnZmz6vpc4N99ETncv0WEUDRZfqIU
	1D1gSo9quyNrZmgOT5xChLi+cfSz6gqeaWO8BSNjGw6hgus75I1tGQ5jUP2Lueo0
	S2V7lRjr6OzVucm26L9jQ378pBe4xNVmFy+ijV7IWW96VDho4/Yx58IKv63MLzSF
	lI4yRMLai/jhLly5duCJwJB8Gb57FeWmoNH3e1OWq36p6I0L/HLi2EOpoUZOx1i3
	jWSvOglXv5QozxII9s7lfK9VfF/LYF5maf10rQ36FoB7fPZh63YOQmZZ5EBWmGyB
	jHdjibXScpRMy4UecsX2UvLG5jY7NXeTAbV+JCWhojo+7mMw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta3uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Jun 2025 17:27:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31332dc2b59so838475a91.0
        for <ath12k@lists.infradead.org>; Thu, 05 Jun 2025 10:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749144447; x=1749749247;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xm6VfkW3b6R38nakzaF1bbb+wxJ3bDtlf6fYnH8p0s=;
        b=RDialV8HV8KfZUYhEmqBZIuq/kxMqj2BD/5dxQKzWIzGR8y8DVklOXAWX0kWrPQz2L
         IXBWatBJ6S6PwNpOtCx8HQjWte3kNAfEP9Ix3skEiuh1KpWIQ0YCp1KcvaLQROrHlnYY
         6Po1ZBk2uBD0yyWrThFV1TdhbLe7X3slN3vNesp9M/WOpkU6CB5JqLpd3n6XwQ3ZK4Km
         jXOzRKr3Xj1bZQvHrGMdmHobot1mTajN+dccfipL6j8RdMB7KjGYAX5sRVKoSyGh5vt5
         durrJaaNvuufUxJce89bVtGgn7p2E9+dAbsWHzRw4+8po8Vp2AYN914ZtVv5Dov4p0D7
         BsTw==
X-Forwarded-Encrypted: i=1; AJvYcCWvv0TwAOzAek6m73hDgjAF5XhIQQh7CNbJ0FNcWj1QnTvSXh6rk5FSAEUe4mACMt1wi/6v38k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7WsChSvVgKeFMq4gj/9F3GfK16+NXNEoS8Hb0BfDfJ3qNpwLG
	MZpECLl1o9vNRT/9/aQ52ZqST2EhLHNLQp12YTCtwiLJp1WBCsYZBCeNV4jzA4D/ZiinQQFoz0x
	gFlYnWPs1aFEaX8sALxqAUjuPTKHtv1pgLpXMEaE4/4uP2iEunYZwKmvzsON88t1f
X-Gm-Gg: ASbGncu/mGrVQgbSeGaiz1Z1IpGT4JZyO83XA2d+6CVr5qDI7KQq+EPcH1bnaK95/5e
	ucWy8iU3G3GiiUVSHro5AQiImMEwOdVCLOp7jGM9r/z8fA8PaeGF/J9nhp1O3Ict3qu+X+HJpqt
	rgvwivi5EZfwdneWaXhtx/vc1Kgz9Qf6RCCDQGbqZ/+2miEDhUeBnUKdP6nJ1P9hZAtHtx6v7Oe
	AE5D31LHV0axTokoI4ciIQDGk4VXfVqOt3q2wjWnPhR7JO39+VyeCG97wPuC6H/OHeY5U+XZy88
	J+UNKptCvDOv9Ngbf3EYILmnjbh4yBvrBdZMio3M52cMr6zqNuVtHmwc2mQ=
X-Received: by 2002:a17:90b:2745:b0:312:ec3b:82c0 with SMTP id 98e67ed59e1d1-31347077370mr763370a91.29.1749144447242;
        Thu, 05 Jun 2025 10:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1HoQdeZlqYAmREaJI3cP23fIbpezAsHxgeEHIl1GsrF8SpIDQpOWIH7S6MY29Twac+yzaog==
X-Received: by 2002:a17:90b:2745:b0:312:ec3b:82c0 with SMTP id 98e67ed59e1d1-31347077370mr763341a91.29.1749144446832;
        Thu, 05 Jun 2025 10:27:26 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f44c28sm11096a91.23.2025.06.05.10.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:27:26 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 10:27:22 -0700
Subject: [PATCH ath-next] wifi: ath12k: Fix hal_reo_cmd_status kernel-doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-hal_reo_cmd_status-kdoc-v1-1-e59f4b814b88@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHnTQWgC/42OQW7CMBBFr4K8xiix40Sw4h4ViiaTMbYgdusxE
 RXK3XGyZdFuRvr6eu/PSzAlTyxOu5dINHv2MZRQ73cCHYQrST+WLFSlTNVWjXRw7xPFHqex5wz
 5wfI2RpSorQZllO7QiEJ/J7L+uZm/BGQnAz2zuJRmACY5JAjoVvPaTeDDCjnPOabf7Zu53tA/h
 +da1tKiaq3t2iMOzTkyH34ecMc4TYdyVvP/NGQ63So9NsYcPzWXZVneNmhgMTEBAAA=
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841d380 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=jmxE7Al2yye8V0ZPzYwA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: vAOijDC3yepAsVaWcWilFl1ciPiP0fro
X-Proofpoint-GUID: vAOijDC3yepAsVaWcWilFl1ciPiP0fro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE1NCBTYWx0ZWRfXwD9QwNy08QLQ
 l6K/u95/kh9XIbzMgV8MdlIIUv69S0dpLqWPGkE0T8bCBWFwp/JIjtb8tejjOOsuXu4aOadJKV+
 noqkNqu0qGfUos/zp95w1oVNMPEztjI878CDYznNBb0FeZlwPvW6txFHyv84xG9DIIpoFPSMzaI
 kzQnPS8YMwnqulHqPHPqSt7oiID55ixZi/1O4r0BImL11XCxxxOR+Lf898KVWgM6AL97cP53pjV
 xaYbERPR2fL8ybdTWt/Dz7AaOUxzuGZtOJ9wWJURQBwuS+NLcPdRd0Dq/q16YPfA0DCs//Je22y
 ldbhOSuH481c+ZIdqlBCbXdBAufZTq9vm/26ChQID8Y0mqqskmalK5HADEyzX1l3GbSHCM5jQKL
 oJRjk3WwcFsXcXhaq/G0EPjgGzsWNXh7FPMYTQnWch3kkbEMfiYnDi6Efx5IAGH/Jakv4RaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=806 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_102729_769642_C17D220E 
X-CRM114-Status: GOOD (  11.96  )
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

Currently a warning is reported when running:

% scripts/kernel-doc -Wall -Werror -none drivers/net/wireless/ath/ath12k/hal.h
Warning: drivers/net/wireless/ath/ath12k/hal.h:596 Enum value 'HAL_REO_CMD_RESOURCE_BLOCKED' not described in enum 'hal_reo_cmd_status'

Add the missing description of HAL_REO_CMD_RESOURCE_BLOCKED.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
Note that although HAL_REO_CMD_DRAIN also does not have a description,
kernel-doc isn't complaining. Furthermore, my analysis indicates that
HAL_REO_CMD_DRAIN may actually not be required, so after that analysis
completes I'll either remove HAL_REO_CMD_DRAIN or document it.
---
 drivers/net/wireless/ath/ath12k/hal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 0ee9c6b26dab..c1750b5dc03c 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -585,7 +585,8 @@ enum hal_reo_cmd_type {
  *			 or cache was blocked
  * @HAL_REO_CMD_FAILED: Command execution failed, could be due to
  *			invalid queue desc
- * @HAL_REO_CMD_RESOURCE_BLOCKED:
+ * @HAL_REO_CMD_RESOURCE_BLOCKED: Command could not be executed because
+ *				  one or more descriptors were blocked
  * @HAL_REO_CMD_DRAIN:
  */
 enum hal_reo_cmd_status {

---
base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5


