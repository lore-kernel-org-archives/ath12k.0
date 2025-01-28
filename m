Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741BDC0218D
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5h+dUy85VIOzVmRi9wjM5b+yqDqTqFXtvnjNP45yaE=; b=eP1yTKjeiiOpQg3Q21PPm48T6O
	N1KjQ3CTBwW7aBtXYb0fIBbu7kKTeZWVmlPfPwwWi8ynFVmYRKAnBdAEC9aYtBti5tmER1e3TTFY/
	LcbEIjx5pz8awwS8708W/nIds4E+ljUchplqq9nGpgku/J798rtVshtAVkHVV1r9ASLK7oatIqJs/
	dLtFRfaHJTKqEAVwTr+Cl8eE9gNa1oa3U/L242gfnh8sSO5J/Ph/13CXHc9FNBRM+tHmfdvdj5ehy
	3+e+2ww4nVTEiXeu+a/0kbz+LlsmpeVWB5/1B8cm78BloFpGsU5zDfirBxRrXpPFbKL6H/hhcdzKN
	xkTVdoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjpq-00000004nRu-0Zlc
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 11:32:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjpn-00000004nRY-3iZC
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 11:32:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S5qxha029347
	for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 11:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o5h+dUy85VIOzVmRi9wjM5b+yqDqTqFXtvnjNP45yaE=; b=PJSTp6SAsysXKGW7
	debaKkh9s2tBoGeX2+IJDOhGBRTwo9WZhADGFgimXVdt5bSAN6D4G6CHEKNQZezl
	fDuW/lIHCL6MqTgapbE5yAyMSV2YbklHzq3CJFtV9LlmPXkcvNI19ONTUA9JMUKU
	jv0NT3HMrcX2nClqvSDEEdJoS+o3jexm46/AEuhnY/qXg6If/faHmyr8M30y4pfD
	sveZtoEFpO7527zp+e1OK1Z5nDtpX+qSR9HTuG5I6993XuvK2H86T/vnoWKMw62y
	efATS+TbSZb7u1QmOIwbSy5BrsH97BFGviy2I4WQiplWXitF4JSqKBsLTjXlrlqJ
	nRjpLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44esfq0t69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 11:32:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6f85325c3so116339685a.1
        for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 03:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738063965; x=1738668765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5h+dUy85VIOzVmRi9wjM5b+yqDqTqFXtvnjNP45yaE=;
        b=MSbMT4FJbJ0v5vH2yiQKx+JJZ2sOOFvWfUzmqe/mAomPSHqoJ+CF3yXZxbuFOr67d1
         wkavzdk14putVu7Y/H4N65Smd6m44b7BeKfLUDGb2X8vVte3LxkQpc5wUVlyuTcDn1MZ
         ORCXk3wFOoJ4hWqpu/ATUpwq8FfnU1js7UEMDBOqnzYk+EtrPJAgoXWhUB453CbwmNdn
         8oq2OZQT6JVmHCsr4kGlyOvpWKDsC4AWzsI/LW0fHUMVZFGg8s03KXgTwIeG2W/eSDjE
         pCSSkVcyYeec8O63pI3ZQOubcmQPLrr/iEh/OiI3VcRp/CRM19ATBVV64NBUvApy3DIW
         a2Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVP0FDdq/ietNr9TfswrK1+fTlSigsu7rcRLVpLPqtUFB4Pf+pb2dDB08DXilVoAPKHnmF44wk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOkt2Fcg89qvL+iJAngLoLrBYzE6cBHT2qVkM/i47tyB/iycFK
	DYKWQgHwENSJVgyHBgpzu7R6hBnd7rRldKjN85GFGIXxEnldJlu/VAPIslACJRcUR5nUmxg1kSw
	Cb/GusD479szTXfTB78kP3qVpxvT+EWtLN+bmWnf4XzgHFAPiibzgc8S8g33n
X-Gm-Gg: ASbGncvVzLPGjniTQkmpbYj59sSu3foF3Ta9SZB49+Cgr7SHSmJcqM7SO57zstM6UYR
	65CrDqvVpOiQfXuWzC0ofNYXaiwjjJQM4z4x3MLg6bCZTSJJvpg9ngbwrHnWejBd7b8ECYPlMMe
	kPk/QgdWUiWE7xcdIxbcTavbMvSbJvJe2fRZrdUUlsaCNQaEz1DeUUPOAl0oRlwkvGLFyLLRqJx
	0stB60Zuoz/sXV1Muj6mLXnmBpZizfNe+UtslfzIH2WcbLzEuaHTJUtj1vT3s8VnOsY+lkoksl5
	GXOqLWBP85nZJzd9ihN7YqXnrt3AfqWrOprRX9sLo4yv1b0VljIAxsVZAiI=
X-Received: by 2002:a05:620a:2586:b0:7b6:e61b:3e60 with SMTP id af79cd13be357-7be6320a38amr2178453985a.7.1738063964895;
        Tue, 28 Jan 2025 03:32:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTczQ+orAkCUidNPLiFqqoARHbxxYwYnNYl2EHUFFhd4mwxYtz0hL2QEaqmLUPdTvLXTIoyQ==
X-Received: by 2002:a05:620a:2586:b0:7b6:e61b:3e60 with SMTP id af79cd13be357-7be6320a38amr2178451785a.7.1738063964561;
        Tue, 28 Jan 2025 03:32:44 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e12199sm762904966b.25.2025.01.28.03.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:32:44 -0800 (PST)
Message-ID: <fd55ba36-d90d-4507-9c52-912f667c4193@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add wifi node for IPQ5332 based
 RDP441
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250128091012.2574478-1-quic_rajkbhag@quicinc.com>
 <20250128091012.2574478-3-quic_rajkbhag@quicinc.com>
 <b3ff05c1-6424-4ace-a873-ddf1a0d3d07d@kernel.org>
 <a752a135-9cd0-402b-b0fb-967491cfdaee@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a752a135-9cd0-402b-b0fb-967491cfdaee@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pmnWCnyTHThSwvPjKDwe-ENPS7zifQIc
X-Proofpoint-ORIG-GUID: pmnWCnyTHThSwvPjKDwe-ENPS7zifQIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_033248_053643_D6D83A65 
X-CRM114-Status: GOOD (  15.63  )
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

On 28.01.2025 10:41 AM, Raj Kumar Bhagat wrote:
> On 1/28/2025 2:52 PM, Krzysztof Kozlowski wrote:
>> On 28/01/2025 10:10, Raj Kumar Bhagat wrote:
>>> +	/*                 Default Profile
>>> +	 * +============+==============+=====================+
>>> +	 * |            |              |                     |
>>> +	 * | Region     | Start Offset |       Size          |
>>> +	 * |            |              |                     |
>>> +	 * +------------+--------------+---------------------+
>>> +	 * |            |              |                     |
>>> +	 * |            |              |                     |
>>> +	 * |            |              |                     |
>>> +	 * | WLAN Q6    |  0x4A900000  |       43MB          |
>>> +	 * |            |              |                     |
>>> +	 * |            |              |                     |
>>> +	 * +------------+--------------+---------------------+
>>> +	 * | M3 Dump    |  0x4D400000  |       1MB           |
>>> +	 * +============+==============+=====================+
>>> +	 * |                                                 |
>>> +	 * |                                                 |
>>> +	 * |                                                 |
>>> +	 * |            Rest of memory for Linux             |
>>> +	 * |                                                 |
>>> +	 * |                                                 |
>>> +	 * |                                                 |
>>> +	 * +=================================================+
>>> +	 */
>>> +
>>> +	reserved-memory {
>>> +		#address-cells = <2>;
>>> +		#size-cells = <2>;
>>> +		ranges;
>>> +
>>> +		q6_region: wcss@4a900000 {
>>> +			reg = <0x0 0x4a900000 0x0 0x02b00000>;
>>> +			no-map;
>>> +		};
>>> +
>>> +		m3_dump: m3-dump@4d400000 {
>>
>> This fails with your wireless patchset.
>>
> 
> Yes, this will fail with v4 wireless patch.
> We have v5 (yet to be sent) to read the correct reserved memory. Since,
> in v4 I was asked to address and send DTS patch separately, The corresponding
> driver patches are yet to be sent.

I think the intention was to send them separately, but together time-wise, so
that the large set of net changes is somewhat shrunk, but the reviewers can
cross-reference both series if/as needed

> 
>>> +			reg = <0x0 0x4D400000 0x0 0x100000>;

Please use lowercase hex

Konrad

