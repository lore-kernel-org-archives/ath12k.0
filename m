Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1407EC0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyEigm+d9Uorqg90VZ3oWzmIVHvWdBi3sutRRozdTgw=; b=gnuH5lg0ZPX99KSpIzoOwx63oQ
	Vz9GhPvR+vRyXuGk7CZUJ3Klcd9clsNJUkb3pmuRm83if79PL2rECg1XxxPifNEoC20018MeR9pm0
	xrXlDbYy89v2I8zV/sITojWCHE8yJIQ/JO5b/ErE8OYTTdjYDoUqPvPB22qgFgUpGkCJRRakF2r2+
	RNYQ7w4w6elJqJQ0zDmwWBgsA52S6l0Jgu/05Ysh30Lg19buGggRMaBWSSlmR4kSdJ2QZahn3NEF0
	vt82M17n4o93u4QmGtyU7G3IK2qQm9GWWSap+IV3RXJeWJb3p2IXsmuN9Mca38EYdA2OpGtc8QhgJ
	dpW7y4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAjj-0000000HFB1-3SmH
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:40:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAjh-0000000HFAL-1B4A
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:40:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IaqYD008831
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyEigm+d9Uorqg90VZ3oWzmIVHvWdBi3sutRRozdTgw=; b=MxjKLJ/rI1V8AwV6
	cZ0eWVW64qKY+kL7/ttX4IV/wCT6Atnq/iedIg3KMvCU0mXSmv3zrBQo6qW9+i2Q
	/cS4mL1X5T/P93icMX/022lFx2cls8mVgGHMC45thg7mjICHnTpXX/z66c3cTEnE
	7x0TVPpjscWHH5rYKkmwpkx9O3JmFxCbQBqlLrH9B7TPRruIM1bKZAG4lZ12PqD1
	j0s2Cijk8i6ywzPtbbiZsDCb8XyWkT8A8zuWBBRsHqEdSBVWD8Jf6PROQnAQ8OFM
	NbBrXETsL0+SgN6qrcBv5o+CFwqBdRiWfCcvx4nlpZk2q5YLtV8l0tEeEMF6Y2Wf
	rk8Kew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k37u12we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:40:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so9510205a91.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738644031; x=1739248831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EyEigm+d9Uorqg90VZ3oWzmIVHvWdBi3sutRRozdTgw=;
        b=HYeDAWNwshbne36DuUNg0bLIDEiHhxNjjpePwIhe0k6OUB9tjdv/x+E6dczRTEBHmR
         /rChtYwWggiJD+Aw1T98aMUAJisXrRzJTGH7fL7dDTTCJ2WJebKe2spoI6/8lAqGQyeC
         XiDZ9+RpXlwoGFOyTxlL1XTBLki00U/jrwrfHP8z1uQzz7bHhPLbeTqTt7/dBY1UICr5
         SO382QW8dD5ylh2P+0z4cbQmfUG1oPo5cTSNfR3TQFDTswpolqjJ0yUD+/AASYuiJSO1
         HxXmh/Jcv7LHL93fOItkw6b4kcb5WQ1fPkcjQk+y13X0x6WHwEq5wTkirkwq38sSY5hD
         eGJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1A/lywQIdxePbgDMF0UqE0xAb5ueOCWldL+eAHufwwOGu/3nnCZTTrDVjmkYAzzjkDLY0nT0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo+uZNi0hRLkLT87ol4tvNS12voHpMSdAJ6j4R5fn8i0hrwdkZ
	5Gd56/KkuH8V2Jmbx8eek/shBVyv41tsSuqUoT+6XI3UxbIXfPBWwOeimFbjFFR+UBTZJ7iJu5s
	DTeMceW5WV731DN3p4wU3Vo88v1X+RRYj/ybB7RmbSv1XJqtXe8s3q3w+l1CK
X-Gm-Gg: ASbGncsfcZyKy7sPwBu1GGKLK/oMDTnFTC23IOCvaM1KUk3Ui5ESCe6g+YVRCxPua9D
	TMSbx+EpG2L9hTfUeZhA292TJUg7zLVazV8X6eWBfymy09VdShxpGsBJaB9y8ZzG46mO9E2BVBv
	xwRznvcORdMA+uldiRYlKnGHSVNPOoA9+tUKfoBZxRcHy2ZJD/c9y6yYa3tud+s1e2UrGfJuw3Y
	n35pz7NOxsS74XSq2iiYvRzD5pxX2KToB3MDv/Ra83DUdirW1issAxnZ35ja8+kdSF7dP0ZiIFl
	1vm9uxX7/1MHPmvn0xRMO4lTLQhOn8vNFO9QU2Y=
X-Received: by 2002:a05:6a00:2908:b0:726:64a5:5f67 with SMTP id d2e1a72fcca58-72fd0c03db4mr34477866b3a.12.1738644030837;
        Mon, 03 Feb 2025 20:40:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmjnxcTQy2/c6ZDU36visnorw1StO/iEunWwfk+QnXtFh2a47nGXWUIUstvIU2lC6Vh3r6Kw==
X-Received: by 2002:a05:6a00:2908:b0:726:64a5:5f67 with SMTP id d2e1a72fcca58-72fd0c03db4mr34477836b3a.12.1738644030406;
        Mon, 03 Feb 2025 20:40:30 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebddbb1easm8951052a12.8.2025.02.03.20.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 20:40:30 -0800 (PST)
Message-ID: <ed23d3c1-7136-43b2-90ee-b46d43d27b2d@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 10:10:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] wifi: ath11k: refactor transmitted arvif retrieval
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
 <20250203214448.1978156-2-aloka.dixit@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250203214448.1978156-2-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mcxvP4I7UKXU3kuPwonUIiFZiZTytHiI
X-Proofpoint-GUID: mcxvP4I7UKXU3kuPwonUIiFZiZTytHiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=673 spamscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_204033_448284_5027C74B 
X-CRM114-Status: GOOD (  12.31  )
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
> Create a new function ath11k_mac_get_tx_arvif() to retrieve 'arvif'
> for the transmitted interface of the MBSSID set. This will help
> modifying the same code path to reflect mac80211 data structure
> changes to support MLO. This also fixes an issue in
> ath11k_mac_update_vif_chan() where tx_arvif is not reset to NULL
> inside for loop during each iteration.
> 

Is this tested? Perhaps you forgot to add "Tested-on:" tag?

> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
> ---



-- 
Aditya

