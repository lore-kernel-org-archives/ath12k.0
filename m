Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BDCC3ABD8
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6c7n5DafH+kHXODhMMCqw3rDnPBMN0KyD+kENoMLGo=; b=SgdAWqNeMKA58OUxTl7DNQwWuE
	7rR9zte1PqR1FDCbcNj/kGVK09JLWZ81PK6xsn5vGR9o5RzJAFTmz2HoW1/h1qh0AWWU+r8PvnfTl
	2Mw67mO9V0vSJEJNvItMkK+DjVZU6ZZspNyjGtCpiS2TpF3XmZ7qKCCI3FR7AoG5sF21+7WYKlLcn
	KY4ZN3L+NwX5fWnTe4UKFig6Bv7d5LLAoqAM0Hk9mwiLvwOCnuBx6diPnCo55yDgGjTUSzICYEt91
	/f8rSO90T3hW+Op7JY1utyKPWQ5OozPykZVsPAGV2NXrnr3SnhEZFisjkcfYPbCwsruMkWbeQNINn
	95T7HAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v4-00000004Tpv-2ClV;
	Fri, 16 May 2025 19:40:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v1-00000004TnH-0un7
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 19:40:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBIDB1026131
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6c7n5DafH+kHXODhMMCqw3rDnPBMN0KyD+kENoMLGo=; b=jon1E7FOhqcR4XMZ
	ngpip/Ik+cyYx36d919nDFR//V2Y7GrLq/v4zaaAdkWw1yFqc6CH2QWdVlQWaSst
	eCiCo8GHKVNmO8g4o3PxRkMxNtPEVZyHKI0FQ0qALlvvwJk5DnUTKFZbyX+hA91j
	A1LroPJBVWR+MWCvLNafVutSkliFeiSqpPYYxQxGAP4E63LbWUCJ9sO6htH1R4v6
	YhAAN25JE9gCUNr7Gc91Y6adrzatKBtpnqj4XgKoFzhfhZWoqoT8nV3+SihcAUQS
	25AJnki4RCBAb7dBLrVv+xlKn+FqfNmu7WYGz3NrIVJU4DnpZPxAl+TJyFKqI+eD
	wTByRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyu82e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22de54b0b97so24528645ad.2
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 12:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747424429; x=1748029229;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6c7n5DafH+kHXODhMMCqw3rDnPBMN0KyD+kENoMLGo=;
        b=V+TOf2YUIUpOcBLsAZdOMw4EaCj0USFi6SM7tQmxaOZUoLp8v4WY8u80o4xdYy2w50
         bSSCX+ZNw8wc9nGMrmifq2tnNOjabQC0ZSCfYNIpIBajG7LMa7m+uj6N8OeTiRUHipwG
         oiGB7IE4sXSbCjr2ISnGJPk2DGtHEWlvR/R5zUNndu/jsbJ3FMR8hKA253uhso8qqj59
         LLkrA3wGbdWhNFnYQ6f4WInuvl8p/c+O0fXzp5tCeyyqTJ0RoAfRGPYW3NYUkTYcWfMh
         /gS2GLIAYK8KzMb0X5FYTfZotY2YqTpsF5A7rRWkOKsDkEWNXOhX0HMRf+bN2xrns03I
         +Slw==
X-Gm-Message-State: AOJu0Yy3XWeBXxsrcjZ4ysg51b1do2Og4RSDf2T46Z8sZo9MjuL60zvM
	RAv9j5eihdeoxxjLFWe5+OLhOtjqhxX5x/2CyZ3HC9WpAMSvOQIl9NCZay3TyIm7jpwOB3GiU5r
	G5hipy/JE914Y8TDVjbzAA7cocw5A4UYH4U7mKToO0TPmyX7HE75Be5abGFyoRrbQ
X-Gm-Gg: ASbGnctWtfzvkBDGd48KFcLnU0l0ONjXB9eWXfoplMg/akdm1M5anBzlbQ6zbl6aBbz
	wxvMzazwuie6jomkv2gSW/ZCnj9xBN9vpLtnKjgAP/VQ21c63DD65kcsewja2wCJ4vcrU5xtySY
	wmgTqsHxZDszMy/E9wOhetDpvBGeBBByZz1sfGOdrsC6/XhQ01CYTRDuuCn2wVzfTV+/eGFLcpm
	QHk8WdpIyifoWq/u+Ll70j1KpYerLMLZkkcclKX92ocYpceFaKAAGn54wnFuh8WzUCamemuI/kG
	beIG+PRKJ9D3RKf78yV1eprlsV+KMLDf2Qer+a92M5dzCXk3
X-Received: by 2002:a17:902:e742:b0:223:4341:a994 with SMTP id d9443c01a7336-231de2e6c97mr49516525ad.9.1747424429370;
        Fri, 16 May 2025 12:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCZ6lxvExb9dHFY4zmyLbDl9SQjg5iXwjDDd8iQxCPbeg4+fT23K57b6hk+lmG1RQDRMYplQ==
X-Received: by 2002:a17:902:e742:b0:223:4341:a994 with SMTP id d9443c01a7336-231de2e6c97mr49516245ad.9.1747424428952;
        Fri, 16 May 2025 12:40:28 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97798sm17955255ad.147.2025.05.16.12.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 12:40:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250416022011.1935-1-kang.yang@oss.qualcomm.com>
References: <20250416022011.1935-1-kang.yang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v7] wifi: ath12k: delete mon reap timer
Message-Id: <174742442831.3316767.12622994031508589555.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 12:40:28 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: dQgDJnQj6exqhdYI8LsQkvZ7Aa7z_rrq
X-Proofpoint-ORIG-GUID: dQgDJnQj6exqhdYI8LsQkvZ7Aa7z_rrq
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682794ae cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=tbk3IEclxwNNDUlJFEYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE5MyBTYWx0ZWRfXxhzuQc+RqFwT
 ILKZblenV92h57Oj5F0E9KGqdwWGSh0S1Y9gAiVYeTfQGW7MJ4sEgtXbev7Sd7i7wQNQaL/2sYq
 uYLVaEE9VqxO3g6tMV50u+TFTkFRetP0kmH9bYhfM4GQbx7WrSUMK6Luv/kRxJmS4jtdHP+QSJM
 djaZMJPsD23CLEBs2cYt363GM8YMh2gAR+/BPk3JsD85om8aMNPA+VL3SCDr/Z7kWISOhlAvAO9
 aZdrbfXSNTSouDl+NRyrDQ4t12+3DwMcmkOwsTm+fCKMDduUFxqWKzuyIcJr8dHDnnfaDYw+7sY
 QrFce3YWMQgZPZxpvJmcuhM4NDw5veMcUXR83crRsiTiTssCURgZVfxC3M1NXtAsGxnfM9pbw/R
 i2gw9elfmwGeY2xLN34pthzVSbv5ClAsZrLimGdQn6uRpDx3ORYVLDAWKBlf0WB1gCVgXicB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=770 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_124031_276565_816C109A 
X-CRM114-Status: UNSURE (   9.77  )
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


On Wed, 16 Apr 2025 10:20:11 +0800, Kang Yang wrote:
> Currently mon reap timer is not used, and it is not needed anymore for
> WCN7850.
> 
> So remove related code.
> 
> This change does not affect QCN9274, as the mon reap timer is not used
> for QCN9274.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: delete mon reap timer
      commit: d1b4ccc24ea66552dd718d2fb2f305ea9ecf8363

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


