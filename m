Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547AEC021B0
	for <ath12k@archiver.kernel.org>; Wed, 19 Feb 2025 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgbUJcAldgo+cnFThyZfjVSmMgZuU/bHqOywGomR4vQ=; b=CxoETQ/nx68YP81R3ntqgAU9E8
	MXrfyfWzu5R6VtObrrQkh6cMuPn0p78qStPyTkw/yenhV4mtLpZEy0BWTQv8NTYGwHp5Zu3Fbuh6r
	ypIlDbRocwBhaI+zNVCRUIXLeAuPjWqTloHlRt1IEgE5nYWj9eyf6G8sdiW9a/RTptaotfPmdpTns
	vbgdSTDKojm7IBRjr9eu/XprVk2A1ixtKHBQjV0SuRu9Q2WCH+G6llBTiptEX8N57iJyJodoN9SX4
	nJ7TGiDcYrjBPTwswJuugo3WkY/G2aPcWpKx4s+qLUhg8O5bNu81misd9ba/9oYAil+rsYJBobQ6f
	4afof9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoLI-0000000EEFw-0BoE
	for ath12k@archiver.kernel.org;
	Wed, 19 Feb 2025 17:58:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoLG-0000000EEF8-0YEt
	for ath12k@lists.infradead.org;
	Wed, 19 Feb 2025 17:58:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JG6naV026862
	for <ath12k@lists.infradead.org>; Wed, 19 Feb 2025 17:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgbUJcAldgo+cnFThyZfjVSmMgZuU/bHqOywGomR4vQ=; b=CHuv75gSQNw8cWto
	7x2xy2sgroglwfCYnlf69dW9na1skACDzsmKXCeGKiC1S4IKeiKHWloasHaS1l8i
	R1KUtmfUeeIj2SK5A66f9xDBdMtZ4ItzjF563FDf3y9PMHYgT87Gseiw4M11oCz4
	6s/JNpE9c2PMMqCIoHWYJU+h3xf+amOgtl9voaH6kt6GcrPFKsHS7FQty75qaQig
	5FvD5NKelUZ/xxPeJmviLOs4OXrc1YLzlp+2+SpjWn1F7ioDTbH7qQVE2qHQY51w
	uttRRo7gwnDrmfagQfr+bfleXz0Y/MzsJrd9DFfXIWp3WmPtwV4Mrtcw+SfTSs3z
	yqt/YQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0khx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Feb 2025 17:58:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-220c86b3ef3so23161605ad.1
        for <ath12k@lists.infradead.org>; Wed, 19 Feb 2025 09:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739987916; x=1740592716;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgbUJcAldgo+cnFThyZfjVSmMgZuU/bHqOywGomR4vQ=;
        b=KtOcTuB8GjxQBgsemb08Q4mGw1BKCrmEpr92n2q2yK6Pfd7t+XzxEbQnbQ1yhnoYuL
         CgnZbnGLKAS8ViCsF+Smm9oc1x6gRB/dFdkZ5tcqFUHxXH0IZRZm0GuvtlL+NxxCyWjc
         7yCKDC5SvO6doHkA9pPLYTXx/4gji0bRLJ+zP+IV8p4unqoHCWw+DXu6hcTJPhklrZTZ
         qj1Vvd/CYso3A0ZSULQrkcVfQDq0xZCdTqroLcNT8b3+jhRAbrkRn8f62q7Y245WiytJ
         ZLAe5n/SL09fUyROVncmBkrQylHZBbbrYQ+c2kMbjGkLPYGYL396GKq0r+jAzEVbGRql
         gGBw==
X-Forwarded-Encrypted: i=1; AJvYcCU/Al1X8Yjggd0bBFUNyZSIxdO9hjtOEijXWEUmy7Y3bXNPZKBuQXAN1VvDOX9/Hpj704nd7c4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx24w74opxjDOhzwwVXF93R3jWvFtN2gZPjy364IzHyzZFAl3Q5
	LfJdGLZHSKOfcCaoI7/LSd7xzxl3B9zWOwpeCiVBxnXWok3vLf4cj8LSEgMd4fuMmuHygf9ax9m
	W3SDxD/BEWzK5xT7d2mkzcIjVvUBapnfV5Lwh//kiE/1uN0+0wGOSSfIchcokN+/55Pje
X-Gm-Gg: ASbGncvmExF4JNCA04CuCvYBSAAXdP/Td2dJsxTx+AZHmNRKZK48SmOFCX5SYbNW4K1
	eNnstywOYALSskYd4Ofvrs4kM0vCv33oKLlNAR/oeVmJXUfA3KLnc0lxrA4ORo16uOHtcr4hWEq
	BVaA4cSgBGAbWalrvVWBQaMwp0QcwcAFmxgXyKiEGgj9r68/9U6adeFgIGZUFzjPbPscu007Gvn
	An+5upY4TKnF9VkIWSr2kYEGmABZ1kAkqo5NuHuGE1RLbdYTA79DIF2sKSajg4iwFYyxT1gZdSB
	EiM4DXddrosEHt6bwOoe/d7cTcgrnCQqgqdzOzH/IaIFJ27W4UqWVHICNdSa
X-Received: by 2002:a17:902:d4c6:b0:21f:97c3:f885 with SMTP id d9443c01a7336-2218c5576a8mr1962045ad.18.1739987916234;
        Wed, 19 Feb 2025 09:58:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGNxtoH0MLvwbXesnFzPINjy1550eaOM02x9owGxmOK4Am91iwrdTAI7fKou7Aq4t/6L1v9Q==
X-Received: by 2002:a17:902:d4c6:b0:21f:97c3:f885 with SMTP id d9443c01a7336-2218c5576a8mr1961655ad.18.1739987915892;
        Wed, 19 Feb 2025 09:58:35 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d7a540aasm105617405ad.245.2025.02.19.09.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 09:58:35 -0800 (PST)
Message-ID: <7e120d90-bbe6-47f5-bf72-c1ee681c97a0@oss.qualcomm.com>
Date: Wed, 19 Feb 2025 09:58:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fbx: Add missing htt_metadata flag in
 ath12k_dp_tx()
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124113331.93476-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250124113331.93476-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yPLXQiPlqOL5roTVr2uHPcqoXLgMLiNj
X-Proofpoint-ORIG-GUID: yPLXQiPlqOL5roTVr2uHPcqoXLgMLiNj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_07,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_095838_190033_70140940 
X-CRM114-Status: GOOD (  11.01  )
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

On 1/24/2025 3:33 AM, Nicolas Escande wrote:
> When AP-VLAN was added, we did not add HTT_TCL_META_DATA_VALID_HTT flag to
> the tx_info's meta_data_flags . Without this flag the firmware seems to
> reject all the broadcast (ap-vlan) frames. So lets add it same as ath11k
> did it in commit 5e8a373c8699 ("ath11k: Add support for dynamic vlan")

checkpatch complains:
WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5e8a373c8699', maybe rebased or not pulled?

And I don't see such a change in kernel.org

Perhaps this is an out-of-tree change that should be referenced in a different
way?

/jeff

