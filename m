Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89F8C369B1
	for <ath12k@archiver.kernel.org>; Sat, 12 Apr 2025 04:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXlkgyW/d2uW7tyDlPRx3ZyerxZ0v0AnHxvv95MSB/Q=; b=0aegUqEPz635X1i/9/Pu8iznUs
	GUzC9ANop6kahq2my4TAdx4NlvoRG4E2mKGoW0Zzh7Kt5Oa4Bin8sw4/Cphw0lDT0v88RmHA9Umw2
	xUrSq2gpHShG7x4BN1Sdh+2GRX+dgmA8uqtCnrvzAqqv+Y5QrX3ApqXUxFs8CFVxvD+jlTUT/EAS3
	XwPZqd24VnvN/rinl2F8c8jBjUhBBFRsB2xcFDVxWBTT5AhyCCrMIvaMKcb3/9t3Qqw6cSb9zFjv5
	nj0yTOoR7PGHtgc3UQnPe+ZiENx3oIbT+DGZhX1pOZADumwGLohD0JNX/HXZ9l4fvMht0UFMruxrF
	MXaupTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPf-0000000FPMh-1nlr
	for ath12k@archiver.kernel.org;
	Sat, 12 Apr 2025 04:24:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPc-0000000FPKs-1A6S
	for ath12k@lists.infradead.org;
	Sat, 12 Apr 2025 04:24:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3keA8019993
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXlkgyW/d2uW7tyDlPRx3ZyerxZ0v0AnHxvv95MSB/Q=; b=B3BMefDaBtOa3kPq
	5wPtiApLL+SBIdfvKFAgzXXsRDygxJmxg9k7AT0sWHibfRZpVBgM/+dM/ayZWKOM
	Y6G74/fx+rz8v7Z2RoqYlsH/UD3OC3NBgtJ/TG7lgFDDoIKHjWc+57tMvLlYK/K7
	rhEzpuRYDO8pwFZCNnxfxK+KUdk0xlPWJIKFWOWXibakIb/eGhjYtu1nhs8O8ZoK
	Dh+CUCQ+Rwj2LGUWkFdKdbLy0uvuv0lhAbKk6U7QeUK6tTJzVvpCU+11SwwdSI16
	ICthw13sQ20P2q+LhinHab5ob2u2J7FYc/EaTd7JJv3Q4yOSzGGVS2/iEH/vg+eO
	fwXrHQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd681u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30828f9af10so1904290a91.3
        for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 21:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431851; x=1745036651;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXlkgyW/d2uW7tyDlPRx3ZyerxZ0v0AnHxvv95MSB/Q=;
        b=FJS2xNrQELvqVjKpz7XP2BnaIsiximbe/8lPQ04osTGWSFqwf4Y39kxd5HwFpu6ei8
         Eges0UloCRBtFuH8YbGqydunp3cMQ7KYZgtoQvac6KPVDMngFS0XcYptZtkET3+hVxPO
         y09mPmoWO92QmX/a99qBhSPkEzb9WWCQW1o2GDTeYoGTcxONmet5Z+kCu+xofhK5zNt3
         5TggKiFx3/rMU6eUIAk5IEG6ypx1gJIVzfd8qg3t+9456hNfsDNxzIugPEIDK5ut/1/q
         Imqg5MHW0CV0UsfGDC1Tyj+5uuaIO76uO5PZT/r9r7WtOT8YgkZDOYPcWb8oXCF0kaS/
         9W5g==
X-Gm-Message-State: AOJu0Yw9a2IWrK+tBVAFZlqiJ6z2iuEM9KFPdEY7OGUb8es09aMWLq2/
	C864w9oERbXiivWpHlD7FhU3CxFi8mWidgfUeZb6GoW4MMDtEHOAlNjvP/HMKzkXqP8n3eL7oxF
	3lzRtno45LFKjsC/av0GCYttUylstR0FNKxM3QYOMr6wmGei2uIytqdymTmn/0O5JIZou
X-Gm-Gg: ASbGncvyI2gJSMDNgci9MtOkiWFEnvnG67Y5Kj6zF5BFE+uBXys9l8XxSR4LTXWTT29
	Ms8ZbWqLlKSG0tfKKmw1ajG2ZX59oO+B8eyNWtQQUGVwqqNMMPsmYOuIuKR3N3nrmCJlrFpm8Y/
	FvNaogpuSmQ9yh5lHAL0JGFedkQc/uS3C+DCyb68BCfQoHavU39YmrsyYowuSONSVIZlwUiNfjW
	4jLz13j0H3WN9QoXcok3Ivy/wJXvWRHrmJc1ABWlJXq5h+5zcyulP6TTpOmiroI3QFjcEiGPby4
	8pxx8jlklfjM16F4510QIGfDgvZOSOZN68eb11lGLFcU7DjO
X-Received: by 2002:a17:90b:2dd2:b0:2ff:72f8:3708 with SMTP id 98e67ed59e1d1-3082365241fmr9190629a91.17.1744431850652;
        Fri, 11 Apr 2025 21:24:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCLK3oAOFk6ELgexdBpH+9HMWc7+kC5/VbiDQAM5BHeLyNGhNwJ8k3OSvOeEtleNqFL9FmoQ==
X-Received: by 2002:a17:90b:2dd2:b0:2ff:72f8:3708 with SMTP id 98e67ed59e1d1-3082365241fmr9190596a91.17.1744431850190;
        Fri, 11 Apr 2025 21:24:10 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Handle of key_cipher in MLD
 AP
Message-Id: <174443184946.2972989.13905647697868648381.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:09 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: yz6gf-Tf3mdt74aOFQIdIpHFYXDCIUQq
X-Proofpoint-GUID: yz6gf-Tf3mdt74aOFQIdIpHFYXDCIUQq
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67f9eaeb cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=FZy-mCtp5WpF6d4t7MsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=647 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212412_322793_71022BDF 
X-CRM114-Status: UNSURE (   8.54  )
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


On Thu, 03 Apr 2025 13:52:05 +0530, Aaradhana Sahu wrote:
> This patch series ensures the correct handling of key_cipher, which
> represents the group cipher of the MLD AP.
> 
> Aaradhana Sahu (2):
>   wifi: ath12k: Resolve multicast packet drop by populating key_cipher
>     in ath12k_install_key()
>   wifi: ath12k: Introduce check against zero for ahvif->key_cipher in
>     ath12k_mac_op_tx()
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Resolve multicast packet drop by populating key_cipher in ath12k_install_key()
      commit: d61c0b3c63462d17e63e5a2b4815e0f1ad17f57e
[2/2] wifi: ath12k: Introduce check against zero for ahvif->key_cipher in ath12k_mac_op_tx()
      commit: 4f4b067dd61695e860f97cae6ed6589a3a7dfba3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


