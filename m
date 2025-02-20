Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188E1C021B2
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 21:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXm8CbCeOCA2MHGIdHbWnAtzNNGJ+p2GLkT+nZHKxRY=; b=4NuVOxEhT0GyTBo8W+uu2xMJng
	2+bOJ/bNYIedPDiX1+rXBLEcvFKzWDvtOEmZ63uLX/+m7XhfSIK6CKO+GQNWbLZncD833MW/CD/Yb
	HVrmoanP1EZg2Gvl7uikNZ1mgAvv4bhoGDa3+8EaZBuXNIILDkOpMHnzF4YcI+pmpcwrMCAGyKcfr
	tFMx9o6ihG3W9KRne9eAhCkYXmC7qkTVk0SoFLY60062XWS8CzWHGDuxJRQ+DlpT3ujU6MQeLhrC8
	7Tq1M5vFBAKO8/IPEEbLLd/8LKjsno8RLq3M+Knlhs9FRkRJXtDm9w28lnXLJmJwfd6hnj3Tijimw
	S8Pwrm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEI4-0000000306h-3a1G
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 21:41:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEI1-0000000305y-2hHl
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 21:41:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KG5nnw012089
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 21:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXm8CbCeOCA2MHGIdHbWnAtzNNGJ+p2GLkT+nZHKxRY=; b=Ixcsmn9tcJp2Dhim
	nFanieDkrWfO+w9H4Z2GHGhf5PHydblsU17TaCOpuUd+7CjY8v5fvZvlHVPnKDTs
	UCaaOWnFnBVroRJrlDBBQNulAG66rgsXIlJUQJrXJYi+rnS9YhLiwHqgsU6FNMfS
	ybcRlodg/LeTH5vERUSLp9wn53he8uxTnqlQYOAKsWNQS/d6zOI2qAFHh/vHQPSk
	Nphvie/FmvcUjXYJDGe+TIi/4YNUizto+S3YsARoEVyjD0EW+mGhgNBvsg64lsHv
	RDj/zjdTPQ6d7XijfwV/TsKb8US0uXXeuUqDypBfIK0J3g7FgbJdP4NFWgKVhSdY
	dNDrnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1qhku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 21:41:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2217a4bfcc7so31115075ad.3
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 13:41:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740087660; x=1740692460;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXm8CbCeOCA2MHGIdHbWnAtzNNGJ+p2GLkT+nZHKxRY=;
        b=V5raAAGGvNYzLfEvYD5EvgADPYEaB1g+Co+BS32MeCk6FuQPTGBybynyBbP3aGQ3Db
         kSSUaVRmIwP0ZhtA1o6CQo0XqBekrBv26C6tJf5cweXsm5aMn2yv73+SgQIFCDRTv/cA
         E60gVhdQ5NI4fF7pkNeqe14owA2fMSDK7I8dUff0qZA9NrS8PgGwdDhUarqDSAhUs9CX
         Pho7lOx/PupMNa9sIYDDxlOiDGoTu5ZK1KGlHEYUZQF7VHYt7r0iCqjz0YptwFo0tzbm
         F8lSkDayrCPPVXe82hvPel0sJZ+eiET7XoVgf7rxdnjm3wqsNAppAo7ESg/OF6gx98gQ
         7pEA==
X-Gm-Message-State: AOJu0YzWXpUad4eioHVOmFIoGSusSdRmGaIaPL3wRoUzglp4Ma0fEID1
	z4rFIPh7crcEzbgMqZuLMy2xE7b3wiMCScvsvMk8MZJ2CRTKbrYTlHHio75kKxmhBnRHBv+Fmy0
	eM+iRwLbyaocfXBXrkeXMInnsHBfCscMt4Nlt3vcY3tzcDZ0Hkp4XskdfsoQy6wPQ6Lll
X-Gm-Gg: ASbGnctKppW0U+9Xhh6mpWDRfHlL6I41j1grkUs8U5dVseqrar6XfRnC66KRC9xrwtt
	oCrc5/V3sAY127AosOxxF3La+nvGLXXD0gPMMB+6MIR/uHJT2hIGmCktELCGO6n5VHX7W//zRtF
	DQ0NBwjP3Y3Yy6B3aKk0F+K5NKvhBTTTEj2L+RGRnxITodE0i5DLqS8pKOqE4deEnm/9QODfwll
	5W0sPIlkcTblPg4/oobRmqnQjnNFf5oaz3E7E5zkmFbwKWfO9BoHDlcH0G4bD9fbkBuRgf95fSu
	XotisacIWBWPlEyfUdF1U65TE+nZhDz9+k6qIA5VCQ==
X-Received: by 2002:a17:902:f60a:b0:21f:752f:f2b1 with SMTP id d9443c01a7336-221a1102975mr4455255ad.30.1740087660070;
        Thu, 20 Feb 2025 13:41:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6nbFDufrU5Thv1T/a7ckrxD6ab/wasTHLWyWamR+AS/BVxp/tYhweWgIUOY3IIHFAixrEtw==
X-Received: by 2002:a17:902:f60a:b0:21f:752f:f2b1 with SMTP id d9443c01a7336-221a1102975mr4455045ad.30.1740087659685;
        Thu, 20 Feb 2025 13:40:59 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545cf8fsm125252215ad.152.2025.02.20.13.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 13:40:59 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250219053640.223734-1-praneesh.p@oss.qualcomm.com>
References: <20250219053640.223734-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: remove redundant declaration of
 ath12k_dp_rx_h_find_peer()
Message-Id: <174008765913.757811.10414072274409589241.b4-ty@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 13:40:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: nA5vZ6p6DnrvomRvV9wFkkWb71685r98
X-Proofpoint-ORIG-GUID: nA5vZ6p6DnrvomRvV9wFkkWb71685r98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=795 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_134101_695399_C14B6F98 
X-CRM114-Status: UNSURE (   9.93  )
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


On Wed, 19 Feb 2025 11:06:40 +0530, P Praneesh wrote:
> The current code in dp_rx.h declares the ath12k_dp_rx_h_find_peer() twice.
> Fix this by removing one of the redundant declarations of
> ath12k_dp_rx_h_find_peer() to ensure that the function is declared only
> once.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove redundant declaration of ath12k_dp_rx_h_find_peer()
      commit: cb9a978a20a4481dd59c3ea8c6fee36b3dac2b47

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


