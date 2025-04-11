Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D90C369AB
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zcD+oP6GvXt5R/I9S/KcXAmPsCSi6ByG0SKvGfDorM=; b=iXkwXROMWgBmOqtRg5TSm09N23
	wZdWqn2RJI0QZmXu4F4ytdXyLZMqg0cSGOrthcngV8TfaWjPOXqpKtwWTY9nRAlxjzybIx85yj1rf
	hZfo1a6Yb3XDWnHA8k/mJTy03d41YPPkQUof9AqFE36IXLoEYcyeI3KsNzzgdphfmPKFDnKZZ+mre
	P81XpIYKaB3xVoW+CwO6fbf/5J063TmA13i2d7E04P/5MBKRtAokcHOHVAc9jouFF0imfaLlMOowc
	NVJCMC6KzW/7/QP+URPJAliCoZpA4yt0DHb9MgoubzfUGdDhdplPq55hmKY0JOZE0uZ7VtMc68iwv
	lX+43SEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u388L-0000000ClmV-3zWa
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 06:45:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37o1-0000000CiC6-0mi8
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:24:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5Fo38014062
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zcD+oP6GvXt5R/I9S/KcXAmPsCSi6ByG0SKvGfDorM=; b=TS5mc+k4z2bTQ95d
	lPu8Jeu888XdGhqBVmhz1elYZINuZawuS4WL02im0gUk+WedPHKLJYW3YW870jNO
	Hdjhdwe2YBxamXE6G4k0JieDRxp+4S4UoWSw4j2d+UO9+JsAffjxRnRc34Le92F3
	mCRaC80IGuk9U9MPM5UQBSrECEcuoCd31mycK0xSj2E8DmCTc6ikodF7wKDp3OGI
	mbge53Ygpuwm5QOt51Ku4sZgv7frHqwr0ztUzq/H/+6bycbEphhBcSriRY7zsedv
	LTZRIYxW5rJqOjnQzY1C0iM65UDWOBPdtm3C9HO9bMK7KLo6xBxHLVp+TBHO1+OY
	4tlORw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbehert-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:24:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73691c75863so1973864b3a.0
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 23:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744352639; x=1744957439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zcD+oP6GvXt5R/I9S/KcXAmPsCSi6ByG0SKvGfDorM=;
        b=OyYKAaZdvcs7bM5ug8qdcbGOyLLMssgAB1mTgIKYgBnmGU5z0dkqUwEDiW/veiPWTV
         2Cb32qMtayo1KnwGNe/TzYyJsELx3aPnOtlaoDNYTJQoq56vhJb85QUyzKCcOoEIAFhF
         f7pOrWq9VQMMHgpQBiMtHOJHTF9JwWfPrwtQZKdTOnQ0YCyr/gAy33AIecg5YiEf6tMJ
         i295PPnbdr81WSzNAivudUf1YGc3+qabMcZD2DFAhXqcbg8+NoljkKa5XA9Ub9tthAru
         RnHVqHlx6zhLj6nICKGCtLTDTlSrtJZWL6bvi4nchtm/hjzwnL5yF7wGJVDTjmYt0yli
         Q64w==
X-Forwarded-Encrypted: i=1; AJvYcCVgeEc1FwXWP5TkWvWqYNwjQNht7Kfv6WqdRRqpobSQRqytV1zb3OaNYZh6Gm1q4RG2fayiD8M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz17ixA9HGd+iu/R49ROum7Zil5LwKcLTSsTbZuVGe8vwCRjv0j
	ur3gUhyPXRKZQcHIVmyudIjxmoTTKnUtvmAKC9OtrcotPX+Mv2+YJMgLduAQHqOmiCuZrFZUt7B
	5tEKKGOIOs4OpSf1hLdoHU23HU21aJyZI9e/AFHQ85Qfeh3v0KAFTC5Af1zDNAXF+VDzj
X-Gm-Gg: ASbGncvsXsk1ACb0jWJ2u58OYbQe/Bc6p1ftwssnOW1PpW4g0jahFxTokzinznSL/r7
	KCTist1K4m77mh+A/tXtZx3QGVo/sERSO7OabaaH+E9iC0Yt9JCrWZxGUR2GYCrlWZs3maN5ksr
	m3jXEAnSO0c9ixKIBusiH5/yUDZkagmFWDa0WmAeIx9H//CM5FnuDl04rLLv96jX/HjDQZEN+IP
	m60cGWkHJRFJDQL4loVhe1ENMW14o2Qp+iPE/E7kTAawGLSsjRdxED3HgMa302mBSkvwaxOrdie
	GkQ/Cgtin4pyWHvyebV/gqvytpmF8k+tGDX37OiMz2UjvzPh/oCr/g==
X-Received: by 2002:a05:6a00:18a9:b0:736:3768:6d74 with SMTP id d2e1a72fcca58-73bd11f3e42mr2227957b3a.7.1744352639055;
        Thu, 10 Apr 2025 23:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVfk6/e27wgKqyLLbgLdDuaIDOgW7c2iQyZ9sMb+9PxZtgHGtKsTOcxiEckdElpEFhYypNsw==
X-Received: by 2002:a05:6a00:18a9:b0:736:3768:6d74 with SMTP id d2e1a72fcca58-73bd11f3e42mr2227939b3a.7.1744352638645;
        Thu, 10 Apr 2025 23:23:58 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c62ecsm700849b3a.62.2025.04.10.23.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:23:58 -0700 (PDT)
Message-ID: <e35aadc1-6e03-b688-7d56-e048ebd38bd8@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:53:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath12k: using msdu end descriptor
 to check for rx multicast packets
Content-Language: en-US
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250411061523.859387-1-quic_sarishar@quicinc.com>
 <20250411061523.859387-2-quic_sarishar@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250411061523.859387-2-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L1iPccPfVGmUWnpA0N1kigjQ8h_988-N
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f8b580 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=j1rpJKVYEw2CWFf7B6oA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: L1iPccPfVGmUWnpA0N1kigjQ8h_988-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=500 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_232401_235906_29E7AFE7 
X-CRM114-Status: UNSURE (   9.87  )
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



On 4/11/2025 11:45 AM, Sarika Sharma wrote:
> Currently, the RX multicast broadcast packet check is performed using
> bit 15 from the info6 field of the MPDU start descriptor. This check
> can also be done using bit 9 from the info5 field of the MSDU end
> descriptor. However, in some scenarios multicast bit is not set when
> fetched from MPDU start descriptor.
> Therefore, checking the RX multicast broadcast packet from the MSDU
> end descriptor is more reliable as it is per MSDU.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

