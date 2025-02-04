Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E2EC02197
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrogID1pMYZlystqZnXZfqQzhY2nVkZQoJG9ivvC1+k=; b=TbpKMWyXA4A1w0yHHDB2IduYzO
	wr8+YWxHw+EqVTTk5w9AsfpTSTZU7BvUFAvrX4CEy1q2k8qgfTe+FcN6TlPJ6nUaY8DuuA4msb5JM
	BmOGkKB4nspj39uNjfHGdK/X5UiDU4vBzBiK9I57NT5kKHi3rAWKgUmPlGhQmNTsCIELV/Z0bnMER
	lwhdh/Ho/rM0y7hvjoau1CaDZ9RTVygv0wXOG5AZMmL6JLMreR5mNflm6gNKln2Pjj//flNAMR54z
	Z6o9Q4DEDrj4pjHyBjQbRWrIHiaH3I+4pfbHcOEWjug8wmMl6AlLga/s1yyZb9bQByhM0FHSD1VlS
	x9AvwKgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAkS-0000000HFGo-1Aan
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:41:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAkQ-0000000HFG3-0qum
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:41:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513JgnNH021210
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrogID1pMYZlystqZnXZfqQzhY2nVkZQoJG9ivvC1+k=; b=CztxU1dg06YtwAmg
	qQxlYJoV3Hx/PoontgKTgfIKOWf/Lvg3PVMU7JmSbrbAN6DjrcHtEDiuaOpJ+jOj
	voaK6dWpmk2KDKEZcku6Vcfcbh+AjG0RX85ojRA9tV0XlP8t8BH1zpniycu5rbVa
	L7dYudmfLAO77BVsPxgKjmSKHq9OxW2T3On5sBiXYDCPyf3Hcyz24pNw9KC7q+lv
	tYyZmBetTlpddppx5TPEKDO8++o4IhlmZSari8YWSJ+t4aR3azZjAYV/Rk86YXsI
	kvaP0K9qC9kWUBUWlEqdLQ+9ycsBhr8vMAWGPpeAVUqaUN41eLHAr5o7+KeH7J/w
	qWf+5Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k46d0x9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:41:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f9c5b046d0so414763a91.0
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738644076; x=1739248876;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrogID1pMYZlystqZnXZfqQzhY2nVkZQoJG9ivvC1+k=;
        b=s7+Dces8fzrShZJbT21D/y605/OmhnwNiU4XMfpmvrtzGGMJAzdElI4heCR5nskryO
         OWMWXBe5FDeQ9dbmde7BLsp5KkRWSMooCJIywVOyRkt7XNmvgSlq9+wDU4qvwteYuGes
         wDZQawptllqI63kzxlfASJQEnp8VvYInXoVTcz3PqXZVMn6vUN9lNVzbqmY1FsJ2P872
         qAf0fPCDRzTNpBZE/j+ClZ7JFo3mIO2lkg4Dd0q98gSTEszpTwAR44Hz1bX2p0At7zpG
         H5/IrECneB6owc/CUExq8K+EhZH+6Bxx5cdB2y6nWMBV1pDd5a3B7VwdwH/KlBhBlrdd
         Rxhw==
X-Forwarded-Encrypted: i=1; AJvYcCXocyfbwZyJsuNv2qR6+xayekPKdpvYs3B41mf4DLGHs1+ODXMcLlxon90zGPJC5nuOtCJMAqY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgswRtI6TeES/535VNi/e93rTJnTBhXWwqEaZFVAIZvBH2Te87
	dXyAAWafk/72HcRKqkbNznrDeclNtZf/k/M4RzTSiU3rVe+UMNuSA/FSS0714iPiAtSufGRLc4M
	WuGPOG7uDLDzYsjfDMLMN24/8coeZDK8yKJSoTJFGTGYivHlGoVYMIXXeevG6
X-Gm-Gg: ASbGnctUfvb+bfdxTPYs1mTBz7vMfwMlgjByJUrlztsbVa0c57Uozuxz6OBlYxUGE/1
	on32IMn/Ekaq7zi+QXjubMYnQkqbywhee9Ss/RZ0oxczvShnf7AnGDOzlj6Dq3PlbMwSJEieCA/
	CUabxEPd730xuwMtTyTxzIaOMeAn6/lFrWW1z60XfxISyugaUAbdtVGLNir8LPMSCz25egZ9Ykd
	jq46jfWZxIx2IAho1U1ZyzJAdLFPNIXpJflDQYvEYCxCgYorrMfxxmH8bA5ZxG7mRWl0/hu/lLj
	JK4abuzq9lt5Ec1QXva6pSqnTMzjJi8en+WbeZg=
X-Received: by 2002:a17:90b:534b:b0:2ee:fdf3:38dd with SMTP id 98e67ed59e1d1-2f83ac6612amr30911550a91.23.1738644075865;
        Mon, 03 Feb 2025 20:41:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEa1rhkr0CIdh+9HkLCDKMZ42p2q47VXgfsEsnBjGWTHSWtVtyZwBVtud/aKzNYvKs4QXCZmw==
X-Received: by 2002:a17:90b:534b:b0:2ee:fdf3:38dd with SMTP id 98e67ed59e1d1-2f83ac6612amr30911535a91.23.1738644075471;
        Mon, 03 Feb 2025 20:41:15 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33205c0sm85364415ad.235.2025.02.03.20.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 20:41:15 -0800 (PST)
Message-ID: <db16febb-a58e-4a60-ab1a-212c30fb5313@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 10:11:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA
 beacon generation
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
 <20250203214448.1978156-3-aloka.dixit@oss.qualcomm.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250203214448.1978156-3-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xUPC8o5k2RqILL8mOxDJzuRqwjEqi-gX
X-Proofpoint-ORIG-GUID: xUPC8o5k2RqILL8mOxDJzuRqwjEqi-gX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=448
 mlxscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_204118_352399_0ADACCDF 
X-CRM114-Status: GOOD (  10.19  )
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

On 2/4/25 03:14, Aloka Dixit wrote:
> Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
> a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
> or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
> the same pointer. Instead store the pointer and pass it to the
> latter two functions.
> 

Same, Is this tested? Perhaps you forgot to add "Tested-on:" tag?

> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
> ---


-- 
Aditya

