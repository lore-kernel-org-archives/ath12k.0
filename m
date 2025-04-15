Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271CAC369B5
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXlkgyW/d2uW7tyDlPRx3ZyerxZ0v0AnHxvv95MSB/Q=; b=vOGVrBM0HZ+Cfz2jTcI3W+eCa5
	Ut/iJwFy0aVcXYXOjVPoA1aUcA0EV58/wShN3Pv19PLit2MaRndaC2zgMKw3Vq/ZkJSFMFPa3hrmB
	0fYtgxrzQ49JyuGB3Y+5UnXYAAbDhbWGe+ByGIoRP+RqJmukFL5ZEpuR5kCa2s+tRB9VEr3gy9t0W
	QXr1JEu9XK9Lr21GOSCkZ3RPraVJbPr3MqjHrGk1NQwInuxoiDERUe6+/Sk3OuyjYrWp3z20JXIBd
	0YXxDss5jf/tPWfl2nAJM617+gZ0INvNBSsI4i6t/MRzU2wjs+bzzTF58iW5VibzuP+JjQmQmp/sn
	WuNgJU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVM-000000067t9-3XkH;
	Tue, 15 Apr 2025 14:43:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVK-000000067sS-2vvb
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 14:43:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tBYw019542
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 14:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXlkgyW/d2uW7tyDlPRx3ZyerxZ0v0AnHxvv95MSB/Q=; b=cEuWt0Ndp91TSISE
	3zZUh5lJYe+myL1NT1Av3LDu9L+iAFGp+fRZ92VUb8LvstPNC9LjBMnoqDNu42V5
	cD07C7aM0cgWpDNFKjh42qaVPTn2KCoZ2zLq0+R5EnmH7nPpiWzA7tx1VDJAUqOk
	nFxwaB5PfpPe6vrqp1h7W7dPemcCCds9Sk0d1V9Zrj5BMlBSYKFzgCL3jG0fHjD2
	cIwkuEXeWlM7LOIYnpX03fTn+SbZcKrkKD7wcj4wNqIaPaCyi6Md2FPgkA9OY+/3
	RT79xDHRSyRmP/rAAd4mIS91acCWFdyz4/S1hYESgfMaX9j7QbGze+UKSCVJ1Mze
	8UOd3Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfd0bpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 14:43:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2255ae39f8fso58590885ad.0
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 07:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744728193; x=1745332993;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXlkgyW/d2uW7tyDlPRx3ZyerxZ0v0AnHxvv95MSB/Q=;
        b=jkSiQ9ykMSTIng9OOtA1+drFW5nhipCpD+gaONbxBluf8iOGRN8CCV6zspzmuK8DtN
         BXSOFQ2P58fZ2WXCwvB0Z08bWPiQSP6HPQqHofEryplqQe4fflWebSyrvy7Uihd4xb4B
         EF0E1ssO4HrLAIWYnERKwgKDiPS8L9hrOjueVSwP7TbzVGxzssiiyVk48Phg6zpQwzbp
         BuceLgE5tSroWSaGzSfDr3eh7+wI+TOfTEGC/0+no0+WbnjWHhZsoGzfo4vZfTvx7uCd
         lFMjaO3CcR43ZJe8PcosHoaGb36x2E5rUie6fOIlhih1FfURs9e2cDsglHaZZzzPdF00
         jEyQ==
X-Gm-Message-State: AOJu0YzsECDUyXiAhFtFnhAuLTjNOMnOdlmOyj324HKicy9Wli0/Wq5D
	GDgarGIEgLURF92va9Wl+eWr4dVfwXmuzU8U5v8L2+t6LzJ3K/M+e4TOVnv+k455T19n0hmWP2j
	JTIfgk3PFBG4ZjS+HHdYY5Jova4ccVI5JB6PZWq06gUHlscnkVGwXazUr0ctljCiOq3FO
X-Gm-Gg: ASbGncvTncXwu7+0XyYccYkDH+e4Z6geSZhRx11WjN1PqQXVRv4gl580SZmxAhF3agR
	KaYRH2l0j1k/oTV1vKLkZFEVChkV8KMUg4iCMVXTyswGgv9qMUo+//D1iIloqVEVUW+U8Femk/U
	C2i05/KnNFypdDvdpo7arHmUGiduNLlknuWegIXfu0hcgT3Hs+DIKkSrZn6CF/5DhXtOTp7xRxJ
	cAn3PdkYqdHKxF5fAcULzjnm4Rz829sBicpCyFHo5NtKorMs/sweQtY5w037TZMm/XN3Ljs60aa
	BSlm8fq1/D02xvbuV7Tkeu33BUVwkcJNg19U8lOPlGdCxPTU
X-Received: by 2002:a17:902:c40f:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22c249bcf31mr43502495ad.21.1744728192894;
        Tue, 15 Apr 2025 07:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ/NVm2J2Frp2qVIu7jmM70y1rV0QM3EVe7tEZI159lNxP+rZoD1H+NG3PgRpb5VDwglxtyg==
X-Received: by 2002:a17:902:c40f:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22c249bcf31mr43502085ad.21.1744728192475;
        Tue, 15 Apr 2025 07:43:12 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5484sm118444955ad.183.2025.04.15.07.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 07:43:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250403082207.3323938-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Handle of key_cipher in MLD
 AP
Message-Id: <174472819184.1897624.3961835732025439774.b4-ty@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 07:43:11 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe7082 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=FZy-mCtp5WpF6d4t7MsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: YH8gypBmxbyMcOaWhbXYemBWaL32_BmI
X-Proofpoint-ORIG-GUID: YH8gypBmxbyMcOaWhbXYemBWaL32_BmI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=647 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_074314_739906_8B5219CB 
X-CRM114-Status: UNSURE (   9.86  )
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


