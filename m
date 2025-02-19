Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6170C021AA
	for <ath12k@archiver.kernel.org>; Wed, 19 Feb 2025 04:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1hJHeRdvrxN7D7bAQ1tkQSoXz5lkTgiTdXGO3DQAd4=; b=45zigRSfjTySGwjTCO6bwt+MLY
	KmknRsKwvBCq4QB6nJDYKq+8kCEtLl9wiAdD3V7OCoHysUeGaQ90+0bvBfwIkXzab2WzpxQfSSc1S
	uTmtWxfq++HV55oFr+M/6fZYXM+56Tv6dLPdv1X1nx9hb6zfVtV6Xi/u2kqUns/JMRebMvbreTSO0
	1vjwE8u2ZFdXPf+qQrias/Ub2yf9JuChkYCXRfe0cCaG/lCRVrw3yZ0tHr+yqxiW4hOCA2EU9Ayju
	35KgoViYYbxDEMh+XYFQ++y1/rAO1srZ4WnnnBxLw6GE8VWKopVbVckEOSh/l0MugSGTYdJzJFFER
	4s78aFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkbqT-0000000AqdE-2KVW
	for ath12k@archiver.kernel.org;
	Wed, 19 Feb 2025 04:38:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkbqR-0000000Aqco-0hjl
	for ath12k@lists.infradead.org;
	Wed, 19 Feb 2025 04:38:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIwHiZ016807
	for <ath12k@lists.infradead.org>; Wed, 19 Feb 2025 04:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1hJHeRdvrxN7D7bAQ1tkQSoXz5lkTgiTdXGO3DQAd4=; b=MC5xWV/c6h9XIZyO
	erb7BNBUkKTbAAPUt8kvA+ivsejwqaJhOp755jMZBUhVoduBC7ONaccgkWjBfFlb
	eOrIVT6/Dft9To4p4G7sCVCJBzKVpWwcdCTyRJ8SbNg3auJstDnYGYBfZjUOedKO
	IhZtAJSJ9NO8SlhTvKj/6/husW/Ixh4Ya+VARxvWeuL8uNxrXQ6yP3XQLBIsYclI
	jtC21yw+JQ2N/UkEyBkAWg1LneAsk6snzzKrR4QNOg2zD0b0doQ95CGxWKiLT4wu
	cClzBbBzZ0N1JFSfsNdeyIagGxOKmB5S61HOaphPMkuDSZrFM5El1S47u81Rnbrt
	cDqs4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy096n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Feb 2025 04:37:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc1c3b3dc7so11586344a91.2
        for <ath12k@lists.infradead.org>; Tue, 18 Feb 2025 20:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739939877; x=1740544677;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1hJHeRdvrxN7D7bAQ1tkQSoXz5lkTgiTdXGO3DQAd4=;
        b=rDqrLFwjP4Fvc85xbfiicxVrTHKoAiqhgwEyGCEbmTthtznpjxJQMu1ls59Z+thtKx
         F+5B9cwcaQzpzcw93zZKjUFwzhrdhhiO9AO7mWt3Pzt8pQL5JMJqLb2T2DpxeMoFou+Q
         gsIPOqd1TOb0i2sdUhFePml2hyvioiXW7nQ59g4y5WbvrVYbrwo4hX7tsnE+UUjZYImo
         x+GXeMqJFaTRIc5KIM6oyjMxoFYiJlSQ/uy75xFbKztO75LOz0o191BGZ0SzWfjS+5mA
         rrdaU9YDAM7JdzCKTDPKolp+tVWucba7ieCi5PGPQk/p5ckAsHGBGRwC0Xhtz5QwlQUp
         rxwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWCqvvrn9rjDzb7vB8h1wNZIyBBspgtAXDOUBD2otHpiYQxce7Q8S3NnmGPlNWnGmFa5EOwbU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlJpmtDkzoheP9LQFUFxu4VYEn+QOUNaGK/QQU1B+nXk3SlkQN
	6NNyT0VphvZWTTcCCJaZX2fhMAzabTh5kRjH40qw3vzPcCfj2Y9YK/9AZC39LT4/nUFZA/ZT/FH
	SZeTXuckg/t8T0kyZixE9cF65o1j42PnRIsX7c/WYm3vE8nwF0eY1B2aPXfLu
X-Gm-Gg: ASbGncsU64kGqASMjFXTxvDUtcUIZrgDqpQEIWmT5svM0B0nL5h1hZzbu4Jv5dYlTR7
	CnlRmAMQh0T5pbDcNTovnpJUQwi0UKYbxCyWKJzvHFSjEIkV6s1Cw+4dHVPXIRj56+5EtZTgJol
	V0onyo/PM5jjRqFuwNcM9WgYRcWRGIGexLIeFS+lGJ7xVa/NRRb+C4h4ld9JgydS7G+BX8y4Fh7
	REj3LYYA+eN7Yn7JdqRoe8GaPaiq0razOUl/ybouCkvdOr2Lp4nKjxUcBTpsgsDjJMX9WVz07Om
	8GHJV49VSGGcoFamGI86VQGW2dzImZDsydM+WwBE710eMb4=
X-Received: by 2002:a17:90b:4c:b0:2ee:d63f:d8f with SMTP id 98e67ed59e1d1-2fcb5a17ce5mr3349357a91.13.1739939876673;
        Tue, 18 Feb 2025 20:37:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFle3lmxHIw+H2gI+gxquxoRm9z5kso3AjZ+ApAGN89RR8ZZNSCaMoSvlE2f4M0BrrspurJcA==
X-Received: by 2002:a17:90b:4c:b0:2ee:d63f:d8f with SMTP id 98e67ed59e1d1-2fcb5a17ce5mr3349329a91.13.1739939876270;
        Tue, 18 Feb 2025 20:37:56 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b4c52sm12915647a91.4.2025.02.18.20.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 20:37:55 -0800 (PST)
Message-ID: <617b8162-863b-1512-9b62-9c49ee07c54d@oss.qualcomm.com>
Date: Wed, 19 Feb 2025 10:07:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 1/4] wifi: ath12k: add configure country code for
 WCN7850
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250212063200.1631-1-quic_kangyang@quicinc.com>
 <20250212063200.1631-2-quic_kangyang@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250212063200.1631-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DvAP90XsSqQVFnBBiFFozivY77Af2nFv
X-Proofpoint-ORIG-GUID: DvAP90XsSqQVFnBBiFFozivY77Af2nFv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_01,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=905 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_203759_225480_0B8917F0 
X-CRM114-Status: GOOD (  11.36  )
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



On 2/12/2025 12:01 PM, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Currently, WMI_SET_INIT_COUNTRY_CMDID is used to set country code for
> WCN7850 and QCN9274.
> 
> But WMI_SET_INIT_COUNTRY_CMDID is not the correct command for WCN7850.
> 
> Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware, which
> is used for WCN7850 to update country code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

