Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CCAC02181
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 18:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BW2U98f9bUqqsQHM0pPFR6VofvOnCVL58IbXM8+xIw=; b=mIW076A2pUpttOqoaUrZooLUET
	RLKQtMPYW1nh3jP37Wenif/xTPtXfwpErEm8fR3XGZJ/3qGvBPJqedxwFV1wfEBcCN2AK3pTmsIFH
	YwJxcK8gX48DMXmrtKkeRJdxmnwk57Sf68El/I3VEe02hYUt7A3mkU4i023BnRKNYEoyR2lAnvpNw
	Ffm66kGALEmKGDiAcaUysMHQcQPUUxg+KQQh4ae6eqsQxLzEDlJiOLgTG88948i5v2H2C5ZElQGAR
	qBLoUM8VFtUTv6F+WKInPtM1iPp0TDqq9CQPPSSq7rR+DlOWr4Bout6MWnymGfGpXE1NpxzM4C9So
	eTijSPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7BY-00000000bRW-48HM
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 18:16:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7BX-00000000bRE-0Sco
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 18:16:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QHWZK7017383
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BW2U98f9bUqqsQHM0pPFR6VofvOnCVL58IbXM8+xIw=; b=P94aFJLQPvMF6/6D
	Jo3hwq12aauq5PPsI0rywAhu9u+lm29/0iT4Egr/NhNvvoa+vY+ARGtRgPW7GOnh
	DWZyzfulljwGMzNqhBlgVx3vLitJ4uOakSlRtwil7nbfYhe3mO2aUmdtyBs1nVrh
	hYwIozi9tPDnrpAaROuWdfhpPmvfVk7RpzvC3CbZrCevxA5ef1+rLWnyeWyJaQv2
	mZUt9FmprLiQIghlQ7deFSxpFH5tqsYq9hQbzXPCWj/zuMz88XL97gPKkGvPh+20
	W/z3+7fCU8/Wd8XwDrNK0ibZRH9Tb2Bmljih1+QAVQMPCiOIphLg/tiy6l8i20f3
	kuypUA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs1pt51n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:16:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2efc3292021so10594952a91.1
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 10:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737915395; x=1738520195;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BW2U98f9bUqqsQHM0pPFR6VofvOnCVL58IbXM8+xIw=;
        b=WEgvRdo3YVZoXtcZY8EiXWloblcnHzn+UdjTe8k1bFjIkx+JNOl/iL9tDdkcQ9ePaq
         Ox8wS2ubANDgwRJubvEQT0AwdXJICZt9mlO/4xULk3fKmUqvpUIB1SlXnPAvQk60U2I7
         wby+VIBSxIF0akNYkdXu6bHDakjTEeCx95jwmaviPa0+dxH8v/hDUh+Ht/zQSLxzkdEk
         u+56pNUCJF+V8C6nqhwL+fEFqvorfuFVqBvDmHSnUmXZnbneEM/haRm5BWAFaxnor9Pi
         dcGrgmng/CDlB7vViHQiJ5Rufj19ofz1ehEnHifnCm/RmZRZjlEDakfkIxOvqP7YP9hs
         Tkcg==
X-Forwarded-Encrypted: i=1; AJvYcCW/dSkQz9Iv4VLr00WkqFeoMlzrKf3dj2PaEbUqLbyM/ptJOhXZf4mvnY9YGRIZwxJ0P20w0vw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXuQN0oheIRX37bcxmTW0Y0e5DCxWpmrClaJsu5+wnZe+qr+y7
	CBvRK2zJxx8qVaSSukw5Oe4WnL50chHnj51c5qI8LALBYy0tZv/nSnA7jm2nrAvsAjzEySXH7kl
	7QqA7Ki7/jFtlitY8fRKtqn2n8ECEHE/7fnX1gULVsub8Hkxsb3v7kM9eY4oFxJhBjeEM
X-Gm-Gg: ASbGnctEvUfiZEEKY4aeG5dN4+ZSSVdSvMk2/KTzDWcBxgY9Pdj5VD36yvjKV9GYlMQ
	ch87Orf7NDWUUTEcisMF/jXTrTiqBJM/OLMppHa4YpVMpIG02MeRAYt2hGeX5aqsElVQkic+Mp5
	+BT/8cR6a2R8CQjbunSvF3tZ+zGjcVYVtzzTZLCZwzhEMvla66d6Xs6SlWR96k/+hzPAgoDTQAf
	VDCGvnF8rhKSSgJQ+8rmRvNgwQ/KFBLQJ8qWa167lEU4xXPkxpJd4tiR8wTXq2MyCuGvqyy3vqT
	e6+wv7/frstAdXzuE8pGdsKyD8omVGwGL7gv3lJtMnpRmpLkMUffkfJ8d3kqnTM4ANfRTUgENQ=
	=
X-Received: by 2002:a17:90b:1f8f:b0:2ee:3cc1:793e with SMTP id 98e67ed59e1d1-2f782d9a198mr49853335a91.32.1737915395319;
        Sun, 26 Jan 2025 10:16:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGun4CAWTga0BhEoL/MdVWK3/hSH2J4Zmhs+JnVVOyeBcIoN+uwv78QtV6WKGN8T4uZVSrD1A==
X-Received: by 2002:a17:90b:1f8f:b0:2ee:3cc1:793e with SMTP id 98e67ed59e1d1-2f782d9a198mr49853310a91.32.1737915394819;
        Sun, 26 Jan 2025 10:16:34 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496cb4810sm4958851a12.66.2025.01.26.10.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 10:16:34 -0800 (PST)
Message-ID: <23d62bef-2393-4232-93ff-82ca4dbc4524@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 10:16:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fbx: fix ath12k_hal_tx_cmd_ext_desc_setup()
 info1 override
To: Nicolas Escande <nico.escande@gmail.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124113352.93638-1-nico.escande@gmail.com>
 <a979cbc5-5cfe-160d-d5b9-9e5ed7513ed1@quicinc.com>
 <D7B63ACJOYD0.1XBZ5VB991KOW@gmail.com>
 <18b47227-6b77-a029-2e80-04a0455ac091@quicinc.com>
 <D7BFM42HW2NL.2IZS207VTCTJN@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <D7BFM42HW2NL.2IZS207VTCTJN@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d1WHAQ-IWn2OY9CjxUWwAkBwvjkUNt8j
X-Proofpoint-ORIG-GUID: d1WHAQ-IWn2OY9CjxUWwAkBwvjkUNt8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=863
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_101639_287189_D5C1EC2E 
X-CRM114-Status: UNSURE (   7.33  )
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

On 1/25/2025 12:21 PM, Nicolas Escande wrote:
> So You guys prefer I remove the fixes tag then ?

Yes, please don't add a Fixes: tag if no current upstream functionality is
broken. This may cause the 'stable' team to spend unnecessary time backporting
the change for no reason.

/jeff

