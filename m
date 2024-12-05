Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F47E7716D
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 04:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tA7vDpEtWnxdqqrfQGX83G+hxmpW0xSW+DnYSlevqn0=; b=wT+4M2sxkxcXkF21LWjxLff0w/
	ahOlKMJ9quA4denaYI5qmgbK/rlYufwdrH1w0xdkKP6+fo6eiDWB7HlOliq9IeaKpf2J43Y+OcweT
	dt7fhAlkKayvbIlFKCpQ/lOKBSNuDzgkdPSxGzEmj0lSa44OXPd6PI1biS1CWcu4NXeWGYL9/1Ykd
	NgRcjRnVxc8qLEw50NU+s7szqziDItCAlMoNxMivoj34PL/g6Ne5siXHS1DMLVj1SQ+bIolKYmz+A
	k8mkHc6/9RIGc6ZxvN1G62Z3cXbOqOI3eOsG3w7+KSX39QWPkFaf1U5zURtZj6vq6Fue6zEx/a7zk
	DNJUdshg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3k4-0000000Ekf4-2DKA
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 04:45:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3k1-0000000Ekea-3rQN
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 04:45:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4Gwr8E023313
	for <ath12k@lists.infradead.org>; Thu, 5 Dec 2024 04:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tA7vDpEtWnxdqqrfQGX83G+hxmpW0xSW+DnYSlevqn0=; b=FtMyrChzk/yZpnRm
	idmwf+4gD5wX2ZGkdf45o6OFBr+Phdbd4i9MkI9yvb4DpkabaMDXQs+pA/X5orbY
	/SlvI4yz+2fuSLrTk2DHLlaHsoz/m5UgyKC5uXBrNwaNWASkb72lolj5PGGobKHQ
	m7nb/LcqSPiCPRL3XAxc4Yui0VQLvrcrGyBZuAStc1i3BHwtOF1I/T8zsk7eXYwY
	wlOScNhzN3DLSP7vJZAucy1VXoezFsVrnbtm406wQj6Y8XoiiHS0/SKQHfCRGf7U
	+mJG6fhX6APitsoef7MnrHFbQDlah/m7J8+tC2KcCu4n9/BiacDi0Z/OMAmlQAbS
	vMfr1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj42b1gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Dec 2024 04:45:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ee4b1a1057so945573a91.1
        for <ath12k@lists.infradead.org>; Wed, 04 Dec 2024 20:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733373926; x=1733978726;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tA7vDpEtWnxdqqrfQGX83G+hxmpW0xSW+DnYSlevqn0=;
        b=Esv/fS+mLIKVjK0yrowG15en+UqNyWPgi5DKMUETvo/SZQHKEWAcTyUZH06acNLvUK
         ywDABpL2spY7vfjiZ6b0sJcKcjBRa31I59gMOT99CSwmz+W/n8apEGZyFXWZDQBru2Il
         olMm8aZ8uXuGAse4whXUbcCU5skkE0kt6bI9rp7MkugbJt+3FBaXaGneTMi/MK0+XAGf
         78H8DqqtzdC8G8fMqpK5YR83JAp0Q7vWWry0sdQTpEtmZvpcMZpDS0iThkwOCgUl6My2
         wmshHbB1xEUOgNxtthbijn6gW5Ph0YZiZKStKYRPdC3esXa5LOAhPXKkPAK0mLQ+ySQF
         OgiA==
X-Forwarded-Encrypted: i=1; AJvYcCUSqPIfjKFSI14mRaiP0M6+dhqXD6UsX6NeM+Qe2XN1COP/XPkTEURb7Pa+67ZairYfBlvzLzc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJWYNt5RVNTMxrvfpLHyGRCpmVIWpGAM5aHJWeCuVG3CA1Szxc
	tXPM3RHJUDtIi/H3HHBJVPPFPoyUarBu7i2r8uB1SAjFs07tlfMXwUUnp4sdb1zWWR5X8GK+24E
	PIQLpEFXpCmelNoW2mNsTHASu2IkQ7gExEkcnbsmIn7vFdfuAUh7M/SJcOAf7
X-Gm-Gg: ASbGncvNkKz16TcGo6+jeEACUDv+weQV870icSZNm/zapx2SHtTxCnBeAY9CxVEhwZK
	s7Ye1onkQ073BDztc8gIhL8cn0Fkw8ZTWjbidy5ar8d25j84Pz1dY9UeZfG8bXc9hTaUqwlD0qm
	cSpUK1MlMiMNNSAgzuveXzVj0z+SYYGlQNlt8uhW/3x7KEH0TYsdy3AtcBBlOd2SMJ6njJv+ivA
	+hlwHPLVzoJn960ds/AZuUitatJCOke+Sf9x6Qma79bbphLuOVR1xZWCfoL2SMwxm8/4F1QpJs5
	7QKlsLRGhaNzR8jpS6a0bfCEuKVq6EC037qtIjxcfFA=
X-Received: by 2002:a17:90b:1b06:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-2ef00f15e0amr13617631a91.0.1733373926389;
        Wed, 04 Dec 2024 20:45:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4cFQBTtp29tsc6k4Dbg41pkutVJ6aXHH/7fhviR6XYSqAiczjHi5OqbnUOOx3fp1vYC6UoA==
X-Received: by 2002:a17:90b:1b06:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-2ef00f15e0amr13617589a91.0.1733373925769;
        Wed, 04 Dec 2024 20:45:25 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef27078a7bsm2305780a91.32.2024.12.04.20.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 20:45:25 -0800 (PST)
Message-ID: <f39ef87c-f1da-4d32-b998-453bc50e3225@oss.qualcomm.com>
Date: Wed, 4 Dec 2024 20:45:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Add support for parsing 64-bit TLVs
To: P Praneesh <quic_ppranees@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241204071238.948885-1-quic_ppranees@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241204071238.948885-1-quic_ppranees@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5dS7j6SFi3RwJiiCr27ANvNyFBXSn9me
X-Proofpoint-ORIG-GUID: 5dS7j6SFi3RwJiiCr27ANvNyFBXSn9me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_204530_088739_37F845AA 
X-CRM114-Status: UNSURE (   9.80  )
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

On 12/3/2024 11:12 PM, P Praneesh wrote:
> There is mismatch between the format of monitor destination TLVs received
> and the expected format by the current implementation. The received TLVs
> are in 64-bit format, while the implementation is designed to handle
> 32-bit TLVs. This leads to incorrect parsing. Fix it by adding support
> for parsing 64-bit TLVs.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


