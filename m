Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D74C02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieWuwDOy7+JflIqyjS44bPCt4QQyEsDp5BcB7aphpzA=; b=QZXYmb99uj7jajAjdxgQQKV/hL
	RRxXfPjTXUq6xRTutpf6JeNW3Q/Azy5I1zF7E0tGg4ydIi+tFFh2d+KNEzfIPlow49LDXOB9W1hA3
	8JAdR8jPrx81vs4rWAcY0mPl63FJ1e9oXzQwANNXx9Eks8d5m/DtAEAAOUqYYgzZFpzgfIn5Wn1nr
	agyIVtcOAEaa+8W6YbuJl/AgjGesRjRUdIOVd3n6QjZHRAsQo547rvaMUkrqrfST76b/CW5iUxryv
	7mDDE6SmfO/al6m9U7ocn8HILZgxD57sMOwAuwHr3hS/ZguGTNQZl+bHB77AwDZomLskg+ZIoinZJ
	6BZl1+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNI4-00000005qia-3pzn
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 16:27:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXN37-00000005ncE-2w4c
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 16:12:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DE6OSZ031386
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 16:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieWuwDOy7+JflIqyjS44bPCt4QQyEsDp5BcB7aphpzA=; b=Zscyj+DI66Ycgen1
	QK+SOzEWqxm3iAPgPsGVx9RKgjYjcRTim8EJBQAlFrjLh3LHVis35eda31yUEQgh
	CWlz/phIH//pFv9QF6+FYHtXw1vjyWm0hjkL13Ny42CEMW7/woSF8QfkCfFVWP/a
	hXnvLM9FFIAWpk+B/nSZnLSwKoQ9dqwRrwV0OHh1aiV6lQD5CSbHgnKETAJA4PJW
	rtYmjZZdv++yjAuxe1oLXvtWBJdIv4MfSVrsvB3+AIK2qOYteVoOwDnvvJUKpVxb
	8oQgTZc3LH6jAXAZKJFnZJNlc068lHF4RQWdYKtDX6eYi7S9X54PUoaOiev7rwhI
	gfwOfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44549w89xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 16:12:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21681a2c0d5so79380345ad.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 08:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736784738; x=1737389538;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ieWuwDOy7+JflIqyjS44bPCt4QQyEsDp5BcB7aphpzA=;
        b=Hc/sQlvozEzHPhp99NNRtpAnH95ZDl2D0Y7Xb5OHyOFQUeVvRjQEBmZ6eUJaKTkP76
         PB87ifjLdu2RM974B3ERWQUR6tYQDYAvYvudk11OCGOK4bgFCqa7cbUhDf9cWoxlZa69
         T3FWHbbDmsTv14N1a7FRZ3SIWJrpZ6o6S4dvqVhcOVeJUFRfCpIuMhQSJiayOKrXg+wq
         rtG+u6f5lA0HkwnGv85eOvdQaWQXC+aGGI0wNwSpQ/2l9RYEbAoJVXC1omKas8+j/nmd
         hviWRfwhq4CTZXqik3lE1b4zIJP5hkt3gW5P2CiUKLzvQYoWCLOgYho3CU6eVzOa8bez
         Z6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjvWv2FAJgYskIQ2LmxqP5xZsilRT04tw/+1mE0pvH7i5mFAJ/LI0Cj/hd5IvHPB3gkUwUVkE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJw2tEPxAPCofnjFLhYjx/QAKW5rfyMI6oGyeRKdIY5WqzQMbR
	IO17p803ZflvojCxm2YtVWmxWq7tmgVWw9Xuy5oFPywHJprjwRZ9+TnE9Op8Nq5ov1bu15eIZKM
	eAz4OwHuYa4Vl5VnDzNhgwpXFjqSSUQzxecHDIhndESOW0rRYQVqFhez9yMiD
X-Gm-Gg: ASbGncsAQSiIPHKBRykbX9ksOe7KiNFa0VFRnqX3891FxiocBKIWuEfQh7dtOOiwg8V
	KA1JaSJ9ah1irio+XVDxdp3/3A2hDRHO065hjxHf6AIepzAoyoszeQYr6aedaVkkyFy2jShttoC
	LfGxoebS7dGt5ulBl9IMJfP3xdPfXEna0+qF4quZYdqKNt9Aej728734S0Q3kfJEAaaEs1qAbJn
	SF3pHF9qddQYaw3gdDgl2s6Jk47kRjYUEZK4PBnAfBDLBM1hazgQQQjHqA/Ec1cAx5Hdkuhoklg
	NWyuPvkb8n5qrqvOUUyhvM/RalDETnaBKYP5fq+HMx1u96QOcg==
X-Received: by 2002:a05:6a00:cd6:b0:729:9f1:69bc with SMTP id d2e1a72fcca58-72d21f45b2fmr30050484b3a.12.1736784736981;
        Mon, 13 Jan 2025 08:12:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5MLo0uEswESY1JctsFSF9kdeKM7IksXCnCDnQO0Mc+cernUwKAZYoUDUMyldbdARRQ3L53w==
X-Received: by 2002:a05:6a00:cd6:b0:729:9f1:69bc with SMTP id d2e1a72fcca58-72d21f45b2fmr30050328b3a.12.1736784734943;
        Mon, 13 Jan 2025 08:12:14 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40568dccsm6064170b3a.47.2025.01.13.08.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 08:12:14 -0800 (PST)
Message-ID: <db1b3d4b-db7f-4c3e-9f58-b3cb3a335677@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 08:12:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] wifi: ath12k: Remove ath12k_get_num_hw() helper
 function
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
 <20250112071630.4059410-4-quic_periyasa@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250112071630.4059410-4-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NidEBOcrMPhGq3iiZfopsKdM7zR-TPjB
X-Proofpoint-GUID: NidEBOcrMPhGq3iiZfopsKdM7zR-TPjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_081221_874607_84116690 
X-CRM114-Status: GOOD (  12.00  )
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

On 1/11/2025 11:16 PM, Karthikeyan Periyasamy wrote:
> Currently, the ath12k_get_num_hw() helper function takes the device handle
> as an argument. Here, the number of hardware is retrieved from the group
> handle. Demanding the device handle from the caller is unnecessary since
> in some cases the group handle is already available. Additionally, there
> is no longer a need for multiple indirections to get the number of
> hardware. Therefore, remove this helper function and directly use
> ag->num_hw. This change also fixes the below Smatch static checker
> warning.
> 
> Smatch warning:
> ath12k_mac_destroy() error: we previously assumed 'ab' could be null
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/ath12k/3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain/
> Closes: https://scan7.scan.coverity.com/#/project-view/52682/11354?selectedIssue=1602340
> Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



