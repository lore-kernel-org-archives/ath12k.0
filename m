Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646B6C7EE30
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5DcKP/Urr7dMC89ZWavo/I1vxkXFJxIQV2Y+VnmMyQ=; b=ruIvUaWM7AdTd/k1KU2/OSS4zA
	PTa0FJDDguUFjJYzOU5v07C3Qy7WPVIeoBzI121nujgvW+akcCmTrBo1ZHx6kWcdyBR4mt/uVw06V
	Zg8iVmkVxnWM56cg6csNOgdlG7oN+lHevX29X3I5uVeVG58/5SoFuUpgJAPNUJsd9DA069z8b6trR
	L3/fhSsX2QVZ36w6xte8bk7qSsD2rq9Y+/AFxGzA2M5jee+wFGwVmuggT7IL7EGcwKeZcMbV41/0N
	/24LRN9moE/0evA3KkixZ35urU3PJ+OnACpfw/+xkMFdyz4jeGQepJ2sS9S3cbPcGgXZPy4UUnG10
	cEiVJnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXQ0-00000004cDA-0VM2;
	Tue, 01 Jul 2025 09:36:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWuf-00000004Y3A-199p
	for ath12k@bombadil.infradead.org;
	Tue, 01 Jul 2025 09:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=L5DcKP/Urr7dMC89ZWavo/I1vxkXFJxIQV2Y+VnmMyQ=; b=e21GZ33xgn1D9BTZFLTAQLIEVK
	ej10TZw6RaLTNK3qisWwwsVYd3udTnCzm084zihI/F5x+Z31BfS1UeTszeBP8ZjjGxQ8LE505iceJ
	Rxwb6Ecx+JihcXTBkXudm1V8oj3zhDLxADRTMnfQ9KU0mIKTCy/ZahfHpVMNyaJNRoOecxvAfOrAl
	dygHpTtLM8nP18EoZbsjx8RSPiLz8zqhZBKX8Yq8ea/o/nUGzWTEk2kcvmrl7MM2CzhTPuBmL2XaZ
	asxR7JQgQAVFmVx7e1Q7YPZoDYuw8NuONQqy0DCtup5atpfPZXRpU1bvlTs3Z4yKIhEHZKhkaCeke
	5YNC3bKA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWub-000000071Fa-3hEi
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 09:04:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613KSuX032540
	for <ath12k@lists.infradead.org>; Tue, 1 Jul 2025 09:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5DcKP/Urr7dMC89ZWavo/I1vxkXFJxIQV2Y+VnmMyQ=; b=QfBFl2yO6FB6Mbqf
	eHGKdvmp4t1zFfzk6ugJN3JcXJ2MkA3bp7eDeI2SNZtzeD0x7nA25yaLk0swj23s
	E7GvHgTeqiuzu3R/4jxjzegGypjrHhohhfY4SOaPJKY3IMPRZzMPPOVOmPJStMFj
	b82Ciri2K/T7YluFNfnLbbdQL3b9V3bGwAo9YwXWYL/q0Y9rqhhv6e02qrB34yj3
	c7V+3wL0HxSCSJZe35MqixE5Tk2NuPQB3KzusN0OBrK+aUDSoYEVXsDn4azD3MAD
	njkJBklCETM4+eG++AV8snod3+YoKZLPD2zn1j/E9/S0hUPY8aV/Y8J2sJ2+9hRK
	iYmHDg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k86bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 09:04:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so8898149a91.2
        for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 02:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751360658; x=1751965458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5DcKP/Urr7dMC89ZWavo/I1vxkXFJxIQV2Y+VnmMyQ=;
        b=sPLa4ab6JIjWVxmkFmNM9IlWruMVzkUWUPkDYzNF0V685rifjdODdRec3Ja/nWJMK9
         zqulcpZ5HhOyqArMgbq4fruS2g1Vaa1qy4M3K+mZnwLLQBO6gqueyj+ZWY0uO0VNimKk
         FmB9UideE2WE4qXS4v5prai8wSc+ICVTGC5rwBHvoghZW7pIcQgBGqWyNOGiF+f0aSCH
         oNJcBKGGjzLXqWOi5Ur8gMs3np0XgDwDtc5VySRIq0+7yr4UknGVRg6VSFmvU7J+LsOB
         VcAsU59ePMY85pamhjIFang5EBD8+yTSFQeEg7eNLuephdTV8oU0ZXSPCUTLUnHBqFbY
         uwYg==
X-Forwarded-Encrypted: i=1; AJvYcCUh0rg5Ey67yXddBk4ipHq/NCybJS39lgsZWmofj1PjPnU9AoPf8RQ1s1fOdYdpT4WIu/2tYfk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJhZR6wfMJtGG2BpXJv3EzfPwVrSYrjDpcbKOaRz9QkuIXa78/
	z8Ct4LL5Ie47+uhk5b6SVboDjqg3QboUp1JQ3IRRMj8U7SuRjKpm7eWVN3g8QhRFT+Vw4w+/uH+
	6iJ+omVA+5WHA6iQCk1naEAuhvDbwKkUmnm+YkfytfcdfjxmgDg0IpxxlY9lBwdFK
X-Gm-Gg: ASbGncsCldsv6CIT1Dg/cVF6hu+zoPI/g8VAm+UINg+MNfts1AVAC9KlThUKZTd9U25
	riyXQ2R+Oal9Zw6a4bdMXtXuzTfK3ClHu4DmykxTZBqC2mG93eqX6YkQedzBkxrnzeVWCOoUXgU
	sNQIqu38EQ09T2nt1VmD87B9cUhZJagjUH4D2Hl10U+6rkDfVsHpeqLbdRnchzzV6sKbD/E+1Mq
	sG7J2WvvivqYDCAiKC5+cP6gVbtKT06B6NKvbTZ8TCmSzeehvIQxhe+gA0gfAR0GIwoz5pCyEvb
	eOQ2cA+4vA29p+CO981Sxu4JfxMxu0HyntOJYkgZmMwqqlN8SxaQAGRBoj0yd9rA
X-Received: by 2002:a17:903:17c7:b0:235:c9ef:c9e1 with SMTP id d9443c01a7336-23ac3bffdb2mr309498205ad.5.1751360658259;
        Tue, 01 Jul 2025 02:04:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2dEYYq5w2zcroM8eLEQvZUJSmsbU1eK7wu9G407TCwPIvh/KG6a3aTkbMYlPZv+zovXY6zA==
X-Received: by 2002:a17:903:17c7:b0:235:c9ef:c9e1 with SMTP id d9443c01a7336-23ac3bffdb2mr309497715ad.5.1751360657687;
        Tue, 01 Jul 2025 02:04:17 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1c05sm104454385ad.16.2025.07.01.02.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:04:17 -0700 (PDT)
Message-ID: <1fc913e0-74de-3079-d775-933e5496590f@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:34:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: properly set bit for pdev mask for
 firmware PPDU_STATS request
Content-Language: en-US
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250630064431.3446333-1-quic_sarishar@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250630064431.3446333-1-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6863a493 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=CUAva7D51FxePqYQcQcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MiBTYWx0ZWRfXy3M1YnX6757A
 u+0+GXtDSF4jotcYM3BnoYIMfRfZG8pyKMkPhFE+TWbC1OtV8WxLIbzJ157EtJhlzfHAFgG8lJV
 Qseysf63G/e1Uhpswigt7CAyuNHbjpf9/f3iD5DwdBlqzZhMuEDgsTinJcSEurbtYwPakd7wLS4
 oCWTxUjiCB9FRt0e6fFQH/EU61mn+gTDSXxn7rNgk6q8AKi/k84ibCL5DoIFLWp/Z/UfCPmMKBo
 Li51a4bpR2Gl4++1I2+/NGLPh8F+DdxjOyRNLlv3b08HTNVv7pnNn9fA8vUAtk5UlDvCmWiv0Lt
 WJk1e1TyDJqnfroX2UFVXVn0X1vqsFYYR9wFwBH5b+kAnoPrTBAYEGjaB9sYNVA+XTslMLdXVAC
 m2hvBpig820zIIc4WCosFzx+9btFWKxaUGc60lQUPBViSWPHWZ1DyVbzl0MNfwCtLyJW7Ffx
X-Proofpoint-ORIG-GUID: KL3pNX4JVb0ui99W6w5xY5cwcyreHO6z
X-Proofpoint-GUID: KL3pNX4JVb0ui99W6w5xY5cwcyreHO6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_100422_403162_8A13EA66 
X-CRM114-Status: GOOD (  14.88  )
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



On 6/30/2025 12:14 PM, Sarika Sharma wrote:
> Currently, the HTT_H2T_MSG_TYPE_PPDU_STATS_CFG request uses bits
> 8 to 15 as the bitmask for HTT_PPDU_STATS_CFG_PDEV_ID for firmware
> PPDU_STATS. However, bit 8 is reserved for SOC stats, and the actual
> PDEV ID should be encoded using bits 9 to 15. This leads to incorrect
> PDEV ID encoding in the request, causing it to either ignore the
> request or apply it to the wrong PDEV.
> 
> Additionally, pdev_mask calculation is done as
> pdev_mask = 1 << (i + 1); (i.e. i= num_rxmda_per_pdev)
> but this is not valid for multiple pdevs(multi-MAC configurations)
> with 1 rxdma per pdev, as this will mask the same value for all pdevs.
> To correctly identify each and exact MAC in multi-MAC configurations,
> the calculation should include ar->pdev_idx:
> pdev_mask = 1 << i + ar->pdev_idx;
> 
> Due to these issues, the firmware does not send PPDU_STATS for the
> intended PDEV, leading to inaccurate and incomplete statistics on the
> host. This might trigger certain WARN_ON() conditions in host that
> rely on these statistics.
> 
> Hence, change the bitmask for HTT_PPDU_STATS_CFG_PDEV_ID as bit 9
> to 15 to properly fill the pdev id in request message and change
> the pdev_mask calculation to consider ar->pdev_idx to mask pdev
> correctly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

