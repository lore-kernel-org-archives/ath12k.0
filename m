Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EF5C021B3
	for <ath12k@archiver.kernel.org>; Fri, 21 Feb 2025 17:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNdBoEHvxBFzNO6vpQe4gdIHhXk5m04IrO8nlwRBJRk=; b=zct1fZggfA0t3ZC0oJBAezTYw6
	TAOKK+K+7+Nyn2c5ZMBLcKhKfcXO7J32Xzd4/3BvnVlm7S9O+Ip4V3wgP1FIE0R8VrEbnPUQZ2SxZ
	ZSo7dlEoaJdZXB40jhaJuIOc5yLv8t2IPM7oerF+EFdfVmPDqkTAh5jyxR2eNuHG/NqL3CU0ZDlqp
	UK1HaWi1McUn8N4anVDiS/Ibc1IggU3HNtLRjdGOVyyZG17QMhpJzQDnfehQl60HfWRDDCskMbalp
	mLdOcBJCdZ99sKenbXu6zfNlcPnN7F2P8AUdRyDkSdum0TxP4wx2mQuXMrKTyHCvvLO3GvJuslys+
	l5F4eSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWlu-00000006Mp5-1ZLU
	for ath12k@archiver.kernel.org;
	Fri, 21 Feb 2025 17:25:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWjm-00000006MS4-2gGS
	for ath12k@lists.infradead.org;
	Fri, 21 Feb 2025 17:22:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L99nEY011864
	for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 17:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNdBoEHvxBFzNO6vpQe4gdIHhXk5m04IrO8nlwRBJRk=; b=fFjjFPlpOQ85UMMM
	j2dphzdgeULeHZXDlC3iedXqjex05uF5D9Hph0mevXdTLN4DJXXxep9AUp0NFSe1
	A11sz1DLNGilJdhLWqj7nIDO3jaR8P3jY1Lwv13OlVjcTOINY/Y6x1jjyAMjj4Xj
	OGfOng6lG26urhJqIqtrGYbeNtzRW+hAtC5ToqOP/L8XxS49PdDMNWDL09Yq4ssw
	g7zeb11+nY4UF8oby4dnec7NS3jzHfXGJmPagW0ErJMy7+dkf2ZrRZy0JFHhA4Ry
	rMZbzZs/BbGkxlN1yj5G/loRTxfbRJdZwr0YxxRh+YIr0LsLiE+hNfROZP2iybjm
	o891UQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2xbcx1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 17:22:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2217b4a48a4so46704735ad.2
        for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 09:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740158573; x=1740763373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GNdBoEHvxBFzNO6vpQe4gdIHhXk5m04IrO8nlwRBJRk=;
        b=Q5aBo+aJtgrLPoHK5aitZf4sV4PmhItsCldDBHF5RqcDA0ieeIDklO0Ebrpn2K8EiD
         Cwd2dN51nmEsaQvPVGB+iN7TjSyklToLZGCflTqEOiLtIZbnlFpIEL5APBFtWs2Hw8lD
         lsM5XTtmXb3jwrsZpmgq6vccAaTZbIzAQcAxwFPtVyXPnn6IN1+7EAl+BNZXc76wpcvW
         KFGOLzsyvVnssilWf640YDgm0GRNEu/BXOrFvaJCMcq3b3h4sdI6Qaxt/rKPdS/sV0Vq
         pr1AZLtxAqVRNeJlTukylR2/PKaE7tzLwwHbESI6PvO12ihrSoAXk73FWj1HUu8unq1U
         /T9g==
X-Forwarded-Encrypted: i=1; AJvYcCW7oE7zimUh3pi89AULf5JrfFcanW4gf6gBKZTQNypA9G6Td2bwYsBV3QpJnpVinEatgZ1oG5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YySIz0jYrGV2sXWoiZ2YhqoUtYeGY4trVsaCpUFjA3lzPDqYhnp
	qrhrNNagjTKYCIt5USC5mARBz9pXE1230jz1QmevjyQiPlr3LRU0bv9gFaOltz+EDlxX7PBeD4v
	yO9oKSnBBqAtXCncByIvhwrUgXzAnY3tNanP2mBbHNk9MbVvRfUUMdK4832TS
X-Gm-Gg: ASbGncvjCH2tznscx98tYQn2p/bjk34K8iCSl3bH/Ib9xMJAbGzpx3Kr2H66tkaN5tV
	C6Qx4lCg0Cm9c5k4HArsb9cXtbQlH5hnPNDvuiuDkKVrrZxG0Sc6HGGDNiCBZ11MgnlqlgXRdOF
	aLlqHMulI5hCGHupkFFxNZmlp+8jzeqaiJNruRJQvo++LxKP+m1f39Jn7/HoyVAfXsBiu4tzv0R
	yU7W/0qamgeSBUfbea1sDJdipWYm2UZ6W8rYauDbMQA3sgjQCeS4LlHzkc2PN7CUj4naqvyMWA4
	rRoU86AsTTCJXiqXn6ZysyqWcAJMymPbcm7Cx8KsTe3mapZFOOuijh/GMwKg
X-Received: by 2002:a17:903:234b:b0:220:bf1d:41e9 with SMTP id d9443c01a7336-221a10eca80mr61061185ad.23.1740158572313;
        Fri, 21 Feb 2025 09:22:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwPI7LayseX+6iIIqLKHSdYu/noBsqY6us9RNj9QmJWtYnVluVQPiWnITlZi2Mfv0sLclRJQ==
X-Received: by 2002:a17:903:234b:b0:220:bf1d:41e9 with SMTP id d9443c01a7336-221a10eca80mr61060795ad.23.1740158571929;
        Fri, 21 Feb 2025 09:22:51 -0800 (PST)
Received: from [192.168.225.142] ([157.46.94.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d53491f7sm138809515ad.38.2025.02.21.09.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 09:22:51 -0800 (PST)
Message-ID: <a2874f49-6725-be71-7428-a2e910c2001d@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 22:52:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 7/8] wifi: ath12k: fix NULL access in assign channel
 context handler
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250221164110.3277222-1-quic_periyasa@quicinc.com>
 <20250221164110.3277222-8-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250221164110.3277222-8-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mJ2k8VMHoOwlNrZIQczL-c0J4-zE9iqL
X-Proofpoint-ORIG-GUID: mJ2k8VMHoOwlNrZIQczL-c0J4-zE9iqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=881 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502210122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_092254_702507_39E78629 
X-CRM114-Status: UNSURE (   8.79  )
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



On 2/21/2025 10:11 PM, Karthikeyan Periyasamy wrote:
> Currently, when ath12k_mac_assign_vif_to_vdev() fails, the radio handle
> (ar) gets accessed fom the link VIF handle (arvif) for debug logging, This
> is incorrect. In the fail scenario, radio handle is NULL. Fix the NULL
> access, avoid radio handle access by moving to the hardware debug logging
> helper function (ath12k_hw_warn).
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

fixes tag?

Vasanth

