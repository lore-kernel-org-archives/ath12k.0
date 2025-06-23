Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B477C7EE2A
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=; b=v6xE8a7x1UGrI3BC5YU76cmJf9
	st8d7tEedxiSxa2rgWfEqIJM7fwE3NMrr63WnnfkwKEjSIGGb8K3vvPKEzYW3Y2DZVqY2GvRiAghc
	59khld77ixxatx5UIxqpDx18tFMf2vwgfQYiOmtdB5ooe5thOYTEtKRdEIYIkfQX4Z4il6UkLtSlE
	E47L/+hU601mLb2TpFhXvgKgbYBCDqYB2tA4a/KAxTPGp7h/V86cXi1rpY5RfztYQe5zuCcq4csKA
	o9j6G0vJBa9FipPSfZm1OWQhbBiouVkNUgUR0Epd60/yf6RGrfwKKHeWkX9RoTlsEGphH+gl8PkSu
	+mGUIIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzk-00000003hIV-3XAj;
	Mon, 23 Jun 2025 18:34:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTa-000000036z5-1hyR
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NBaXQu028768
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=; b=NDOmiEujLEJlm+jV
	nPQLPkIh2FFlXdgYivocvH5oIbD50XVwpmwavq/6jNOo3EmMC8q2/b7JSLWRwTDo
	eoe7KIhtAiJpxRSjAnMB4mfYXXhGvHJAKoDZFpwbw2svzW7MZy6pqWFXejVClcV6
	y843WQdQ6K9ivDvbOpYjoGr4gyle3RRpDA2omBTNHnuGW8/owF328R5N2zuaYUY5
	Glv0hPPwJWb2QrskxcsV8SxqhY+94+EzKbbKtCXzIAzfKLAKRPPPx3UPccc6M0i0
	vFF3ILiP1YQaJ1kM9CQRCIUmCS81GS/gJKCiOiyXpQOz3dakDNfc+tBz8HXtic5Q
	1PMJbg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k1sxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2eea1c2e97so3106845a12.2
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690128; x=1751294928;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=;
        b=lVUxePsA5bfyM05rcpH56eLGh84wAAN0VUhBbrLzN/rQJeyyDH0Qbspgg/YAD8bhRP
         q0L45Y4hybiUIlM5M9Gh3wWE6Bbn2Id0KokwX+Iip/Dg2+r0oKSr2Hp/gdOAqIljJev3
         2uKxIHsbP1QU5Fruwa4AJP2Y+FfEmCEHk+Ap1WZp149EOK54yvH4XUDI6943ZUWSTGif
         oCG855+mP0Zer8VdMXGf+0H/v6RiZFWBX24IH6D7ViVUVZMJBh9LzoTtpVl9ncCf/eIx
         bFz6Q/f4egHE+07iSaqp7oNoPgZ33Zi3y7600VEn6m98GudXitAGa3REWWeWu1IlDXji
         Q9Ug==
X-Forwarded-Encrypted: i=1; AJvYcCV6QUdY3txXbTpfXZQ0B8WJL4khOtQFxDoVej6kvbJyXawKMdR14VkgBPRKfNb+xTJv/fqNias=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4hhBVoVYcPjVdm2ORyoEMCN92aNR7EBksVd24Roa0pzo9C51W
	CxNpNuFzW3gN2oZFK2V+AMM7yy5MWZ+ZzyTqu7pp2bLELquTHYUnqXJfCumOk6P6Zo7RKl0xyqx
	gZJbeQyAp2wvsLCJ/+g5mCSm0/mu+8Irg5wFRES8fuqnkrHXfl6YJ73LPMDCBZSD1
X-Gm-Gg: ASbGncuvRPSAC54CSusuXkMrXk6zkS0jGQfpKNiYA/hGWV66J+R2pU6d5YlnjO3AtfJ
	GkSG+81NcETad81eEhhTNNp1awBiXYhf/Q21TS63LV4BL8EbpgUmpy1H/piz1+Yr1g0CfPoGOAR
	cAkca1quFjFIe8H+aOUMxGn9PID1u2eHbiH0oc5gUrj62ewFCKKdjIW9nA96NNAEQLDiSmJ6zR1
	W8jzG3Damx738xe+qPvouN9oIuDQFFQPbozQVNCt3sLbkKAlWtpfyEHu3TBwfOB/0EO2Dwa1mTY
	C1+dvs3F72e40Csm+LnUJTII7q65yu0npt23eCBfF2eqv6LseZGmtIFRAls=
X-Received: by 2002:a05:6a20:728a:b0:21f:74b5:e8cf with SMTP id adf61e73a8af0-22026e47ac5mr20602344637.25.1750690128250;
        Mon, 23 Jun 2025 07:48:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHhT/7HTLqOoGddSf9WDDsTxORjqJ/SfHm0+ETtMJ1rsYsqMcKPrqpqZxFiopZf4JOj4k/SA==
X-Received: by 2002:a05:6a20:728a:b0:21f:74b5:e8cf with SMTP id adf61e73a8af0-22026e47ac5mr20602309637.25.1750690127859;
        Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/5] wifi: ath: Add missing includes of
 export.h
Message-Id: <175069012683.3758471.9698383719451711198.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:46 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=68596951 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1ICI1GVrwY_GNP6_Nl0A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: a0P3i3Eo7E5umfs09wCXDsU09ngghLey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfXy/tb8WK7nJUL
 LIBpzZHhlR3l4Xw18fjDM1QAZjAM7bkyf+DOh7B+gBDFHubEWsAXDPZ3q2RTGhS2QSMzl8bFzgc
 AGcB8JVMLwYaO5oWBIplqqo+VIRZjU7JOV/qeLcWnrELTiXAHYrr8e8kMdbGiGY1WrNX0ZnsF5H
 IgSUKIXxuvik/sy3Pm92eqTHeEG9Hup1W4WhJQa6ivupn0J1D514voAEv008VgTy7sMHuf9g1i3
 ptwXrYQQww/QsZf3XPDovUOxi+cRvX4wYRTTm/3tnzuSD04Ly83zZChzPeWdwVmTO3EBxqtUUT3
 u40Wn2QC/E47TDCl/nySDf8hGzNzCPy7ZD/b+WoWay+isc1lJZSMbHNRMuRwZYf3UNgITH9btOZ
 K9JfW6WDtQjlsdsyrq4k5nA7ArbhOxF4r5gwkfo2qHIzyUCKp0u7NNtxzgAH7ftWbtzCCya4
X-Proofpoint-GUID: a0P3i3Eo7E5umfs09wCXDsU09ngghLey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=721 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074850_580078_988082F1 
X-CRM114-Status: UNSURE (   8.68  )
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


On Wed, 11 Jun 2025 09:13:53 -0700, Jeff Johnson wrote:
> commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") added a check which is now generating
> warnings. Fix the ones in drivers/net/wireless/ath/...
> 

Applied, thanks!

[1/5] wifi: ath: Add missing include of export.h
      commit: 3abe2740e50f86401aa3518e9b69c6abefaa020a
[2/5] wifi: ath9k: Add missing include of export.h
      commit: e435827f6d0c4ace62cc9dfed5e337fa4549994a
[3/5] wifi: ath10k: Add missing include of export.h
      commit: 32c3a0f8894311c743b2a6a15b50b13d01411ce1
[4/5] wifi: ath11k: Add missing include of export.h
      commit: f204e0377efeb5f42c7c518febf82f4af32567f0
[5/5] wifi: ath12k: Add missing include of export.h
      commit: c19c24c3b9e2c4d656472738f67ffc68a9b85cb0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


