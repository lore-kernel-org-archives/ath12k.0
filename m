Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D278C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 07:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbwStFNGk9ZhRMrgv+Nm5kTajVLbIXujL+q9pSKJ5NI=; b=QFJJ2f0YeM0iQxXZ08W9Ef0YpX
	ZSjGZ4zYdGNJ2A0XchSodsS7lTkopm16qAAcbCkqBTlhxWaAYEt3eBOvVqflyuyBzEiaaD3dGZhvt
	4sx9THe/1nWG2n6I4XRBTsfBURbtdJmouBVflbOOd42sq59gOVL1qQJtpylZFloQx27yryO8Gg+Up
	2j7SS6KO1sHvts5OqEAgtbRDJSHw4z/N+TQmvN6cOVtwAQu6hQDJs7uMoSKBw1BR+8niRCON03E0j
	CP3EWnK9NDbVzoceS7zRNlyVjv0Ns2yQuKJRQKS5B/eDy1JtW7mtJP2yPNzYIFSuQa7341kAlI/1i
	2Loe30NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDUa-0000000HRDW-18cy
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 07:37:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDUY-0000000HRCF-0fl5
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 07:37:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IpqFO006214
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 07:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbwStFNGk9ZhRMrgv+Nm5kTajVLbIXujL+q9pSKJ5NI=; b=pDWLo6YocF4LlGCt
	sHAeq6rD4m0Y21g20iibOWPabm+doVQR449DUm21CZUKW2/1GFr5g/R9W15HM0vp
	oE/kOkoB5qhf6srnTo0Ydyx+HEi69b644D4jrhswBfoWFgR5VJSCFKiQ7VT3u0gU
	qoRSo+ZbQiO78TBzD42J4pc6OCKB1yFzZQFMdwEqqVZO26Vn0HsiN7x1QCi3fqxZ
	Ij+z9MEUUwr9WCHVMrbMtPRvTJIvCZVP8P5kxQZfZTgsNhazCTUdx4J545Hi+kqJ
	BlP6YCJTyd43oAQNdbRrxVWNINNsZS1tX+w1MdSwd4jRbJmYsFajP91GstdchsBd
	tOkCYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3ex1cmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 07:37:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216311faa51so98112235ad.0
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 23:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654624; x=1739259424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbwStFNGk9ZhRMrgv+Nm5kTajVLbIXujL+q9pSKJ5NI=;
        b=N2dERxvJfK9Ozh+PsZstT2PIAlDuc8UDCLdn+ClXxPfMoaYxr/kRqdIGKlCqr+Nbi+
         wPg7WPcuj8vDTjYyhsM3VXug+D6De5PhvppJINu3pwCyeSYQG4+XtDmhDc3dEebuDPqb
         1/TLDUdUw/xHxpTzczo3zF3W95DB8roxL1JtRIVcLMdKm/bne8mIhIt9aKPiPHeeDxUI
         rfxGkgAWZ2HG6ad9ExdMb1QIYOrnidrXvD5omNaI1KZssT1YG1+vw4Zhd6TdoT44+GYa
         kv4iRlF4IUUwNUn8srHXQwnS5X0u+YR/A2KmJRQUhd1GQN1V+iRCUq4oVApbCPtUhqNr
         WQxg==
X-Forwarded-Encrypted: i=1; AJvYcCV9tETHhRuO9zLIZphcMR5vvdr1pOJD2T9M7xwvHFSU/UHjod8WcpTiiVx47uUGkNnfscmP4F8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+VYNW4blsTHpfZVh3ZSAoFvyalAIVTFr0TJhGvPkzP2fcF0g9
	4FsetFTRT4CV8ei7U+6o3v8EdS7szmTuSBYz9m4fovcw1LcPqJVfWzEmyXOtqOdcN8gxBaajZ/7
	qVyhKutu61yEfiWx26pLtXewOn6W6T3YCCMD7MiUwBQ1Q171ZRNjtotScGXaK
X-Gm-Gg: ASbGncvVD8hZ1B+GfWvvZESacug8duLBINgppLFUnAtqGh+v1BHhEUqDWM3MNK/OsfT
	+h/ri2kB+ir0OIhWtPk8G+rI5J+6rgWNSmzqcZ78QDhD0dOrk0WJBPXYCG33fDi+eYxhnP4xBDA
	1fWJADmEk6fuId4vtnUYN+t/dLxwxpl9rKGQ/ukAzAUkTI0637bsHle+UIKy2p8LDWEuvn1lAMm
	gTnm8YIkjZDirDSQIsgc56qyFrwHOCd0tAABq8C5a3EyIbPf8ryr8RYuHzxWxzi1YiPK53ZvagG
	ymuiEZd2nLxN1yEf/uzy4iJzq7ZEKEmqsxihcqYdVGuLfg4=
X-Received: by 2002:a17:902:d4c3:b0:216:4122:ab3a with SMTP id d9443c01a7336-21f01bfe787mr25218485ad.1.1738654623924;
        Mon, 03 Feb 2025 23:37:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuEU+vfG/VEyomAMLpVLBwLsqanyokCnh8B0G+p9cv2aesNTSbKyF5VnvwOJIU0lP2it/1cA==
X-Received: by 2002:a17:902:d4c3:b0:216:4122:ab3a with SMTP id d9443c01a7336-21f01bfe787mr25218165ad.1.1738654623579;
        Mon, 03 Feb 2025 23:37:03 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31edddfsm89276605ad.8.2025.02.03.23.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:37:03 -0800 (PST)
Message-ID: <70e67b9b-1ddd-b306-595f-7cc6802ba803@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:07:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 8/8] wifi: ath12k: handle link removal in
 change_vif_links()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-8-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-8-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yGsa7aGK96g-QVxREOlgLCluPdWS0LDp
X-Proofpoint-GUID: yGsa7aGK96g-QVxREOlgLCluPdWS0LDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=780
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_233706_317284_ED949E8B 
X-CRM114-Status: GOOD (  10.13  )
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



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> Currently, the link interface is deleted during channel unassignment, which
> does not align with mac80211 link handling. Therefore, add changes to only
> perform vdev down during channel unassignment. The actual vdev deletion
> will occur in change_vif_links().
> 
> Additionally, since the link arvif is currently allocated in
> change_vif_links(), to maintain symmetry, add changes to deallocate the
> link arvif in change_vif_links() as well.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

