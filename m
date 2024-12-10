Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52ABAE7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuT7sexJqrl+drwkywE4TpkVkXimVN+YkzX3PdE2lPg=; b=zXpTzcn0fweNcNx7Wz4MqdfPeE
	bLEnmlQqjfGpEb85j/RCptcYLR8x4rQ3mCEBRZ2/XrzBWBr+wEGMd4WC0APMf3RFL7sl1RbufT88C
	GZ32hbfoi5DtvgIcyYYY3ButyC1dxwdxp93FtjfprkeHV247Bv9eg1bHGuTVJrAoYCcYHxxweCCBo
	z62yR03TM4nspGZzf8sTAk+zu5auqVl82KAaTaxd0k3F8P+SjGx3xZbKzv/6ZSNcn+78teSD2opSZ
	zP8a/UzfhHlMvn/kVyDCKIQx7G+DT6vpgFQzv2xX0TvyZ2qcs8ztboR5C9zNUJC+orYVHJJfKTXPZ
	66xyDNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtxd-0000000ASvw-0HN0
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 06:43:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtMl-0000000AMc4-2Z4m
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 06:05:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9HtKjX024253
	for <ath12k@lists.infradead.org>; Tue, 10 Dec 2024 06:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuT7sexJqrl+drwkywE4TpkVkXimVN+YkzX3PdE2lPg=; b=C9u5KqNovIKxiPE2
	Qx2IobVsWgK8/w96zZlTOUPmZjO4xax5pIBkg0Y5VXOLYkkdLjVnCihubtdfOptL
	LHcjG6wt/+JiFBVWQ4JPaBr7TmjtjWKtFR+dwBGiIMHrHBlMjNVeaLp7Z9CYwEHF
	H77cFovjkCQb01XxrMmhzZODerO0F91hHYtlWCUMkpulGNfResW+ZtfTnHCg1kb5
	212HZYD//h8JUOz+1BmOnVZKjRpPWbc1RLPSIY3cTIMhTTxoynaoqMgwJYwbosH3
	Kr2kwaq+pt/4+T+eKVe9Ib+27OcXkqebzGGwi3tRWS6lz5ZJCjZusFRFvWufK4go
	huJydg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e5c7sh5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Dec 2024 06:05:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2162259a5dcso47295655ad.3
        for <ath12k@lists.infradead.org>; Mon, 09 Dec 2024 22:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733810701; x=1734415501;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuT7sexJqrl+drwkywE4TpkVkXimVN+YkzX3PdE2lPg=;
        b=ned41CyJN4gqcCNaN9obnzA22uuc8Tq5o5TADHvkBkgoaBqs972CozESjBWv1MA+I2
         e4jR716Dz6Cc5Mr+RfrvbQHO1SkC1eIqZBAimf3jjmklHs4RVDNEYaLvAxkQP2wdelCr
         QaQNCTvETbvQQGjvZeBBCbEfmTVPy0B8pMV2Hhz9XpppWi+oNE9NPt9GKPpBq/Q97ZFR
         vx9Nk5LvdYMuOvr5c+GOCZbc1pvXQllVt8PusyOyBQl86tCVd95ZZZqYK+MPMVYSJGIK
         4tr25kZ6yx+k1Dy6Joie5PtvUNnOTosGpc21tbbKWtJYFVc3AhpdZBvDjloF6/FfSGvI
         8E4w==
X-Forwarded-Encrypted: i=1; AJvYcCXRP6MAXp6qDVqvEegsdIFytUiwCm+byrEIjGc5kX6b3UhIw9s/vDvY9w0Sb6GQleR0TQem+BI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLtg3ZDJQ7NYxaKEGLcbgnk7qudOgVjK2b8hWQhmz7XOvt5Rco
	wwn1nwJE0ZLCnSF/zcKvCkQ50skrKxA94Syd4zoJZdC0p5/mXQo91ckw/dk6eljycuOrqUMMOwg
	N0vWUNnWZM/CP6AsNRHUsazdesszNvLjIsKDnikk85ugHGn2pIfhBSljyfhMb
X-Gm-Gg: ASbGncu7i2I7gre80ss1GRWeRX3dO+4Biz2cSXYwEG1CIlBAT/66MwbbxIBZX3cFJkB
	kkhDNxOMBQeSQP5DQ6KahoJDM7FfB1VFm0j+GSGkz7IbM4TbUOol5nTq5XbSDf01jykvPXDjfEx
	Eej72VdLCv7jZjzZZ/cXUSwU2nE0CszGTdLdGo5mNRf8tanJ7HhvlkMC6brHwza3PpmySPK/kY/
	QOEYOsj3v820IaKqcVvELnzn+ZhWuLJ3g8JW4oQCEK5GETw5s1nWKqjivhGkfpy7ObBGFzhx9+g
	opVQ2wIBigSkMMUoyCpyNl2ZP7AMLJjtB7ZoX4Vp7OvWL4c=
X-Received: by 2002:a17:902:eccc:b0:216:49b1:fadc with SMTP id d9443c01a7336-21649b1fd08mr106886845ad.42.1733810700978;
        Mon, 09 Dec 2024 22:05:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdZTBCMs7H1WTg5zLzKGDgofWMITKz9UCc3WUTnRaIn+Lttr79ry9IlBjhjDkydSu0LKbL1w==
X-Received: by 2002:a17:902:eccc:b0:216:49b1:fadc with SMTP id d9443c01a7336-21649b1fd08mr106886535ad.42.1733810700587;
        Mon, 09 Dec 2024 22:05:00 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21618d9beafsm64535765ad.6.2024.12.09.22.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 22:05:00 -0800 (PST)
Message-ID: <fc745e1c-cfad-4ccf-aa9c-77cb76c2f23d@oss.qualcomm.com>
Date: Mon, 9 Dec 2024 22:04:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix read pointer after free in
 ath12k_mac_assign_vif_to_vdev()
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241210-read_after_free-v1-1-969f69c7d66c@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241210-read_after_free-v1-1-969f69c7d66c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tNquYkbJwoM0fQYGTmWoY6Six9LRQNji
X-Proofpoint-ORIG-GUID: tNquYkbJwoM0fQYGTmWoY6Six9LRQNji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=768 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_220503_777629_7EC24B6E 
X-CRM114-Status: UNSURE (   9.72  )
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

On 12/9/2024 9:26 PM, Aditya Kumar Singh wrote:
> In ath12k_mac_assign_vif_to_vdev(), if arvif is created on a different
> radio, it gets deleted from that radio through a call to
> ath12k_mac_unassign_link_vif(). This action frees the arvif pointer.
> Subsequently, there is a check involving arvif, which will result in a
> read-after-free scenario.
> 
> Fix this by moving this check after arvif is again assigned via call to
> ath12k_mac_assign_link_vif().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Closes: https://scan5.scan.coverity.com/#/project-view/63541/10063?selectedIssue=1636423
> Fixes: b5068bc9180d ("wifi: ath12k: Cache vdev configs before vdev create")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


