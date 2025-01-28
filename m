Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5024C0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 14:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AroXVuyqk4ebuD7fOzoCQq+wPsBrvou1mnrYuKOiENo=; b=YDCPNYhqSa+libUq5yb7M3WKaB
	pWV0vXPxrjuihQ3m7S9dWmZfWjBULyhcQ6qmfuVVdmD/KfuRvhSBi2FTH1QkHSbbH8GGDd5Frs8SW
	FRbwbFumNVF6bQtEnZme/SC0wlAZkxReampGTcrY+N9TgT+vQE+WiEhdjKJzwaRC2AdFdK2vXHS2u
	ttJYsSZRSGDULRE2XevjBkMjjLTSOmPRqfXmb1/tHe9G2Xa/iJ18Jc9LMm0X7clgQ+j+iywCFSwNw
	2R+QMRdmmD3rLU8vZqSKvvjr5AiIUUthKUb9thFTdM0BHMtLtNUAcLriW3t8EykwLinq70WjRdwPD
	9dAoYb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmxm-00000005520-2Rt3
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 14:53:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmxj-0000000551b-3oUU
	for ath12k@lists.infradead.org;
	Tue, 28 Jan 2025 14:53:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SD47DB011703
	for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 14:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AroXVuyqk4ebuD7fOzoCQq+wPsBrvou1mnrYuKOiENo=; b=dDLjCMWHCyvqHHOX
	PShuUUnv1N+gapm8KpH3KDWJgrdDxDLp9qRYfzvj+5vYdNd2AcaZuhvaTEfCDM5+
	xYTATlBpUW45y7Ok7E+8fOsxUwvOvVVDatNQvVLn0UkWabD77ematgJde1LCQh0w
	XYFuuXvLhD5Qq3QIh26hJEt1qRRQI0uJfwFtROrDXnoLEfp4Ky5NuwnbQ+FEhQy+
	qSq93gclpFzznaAGiczSSw0bUkgKog+gBdgD2W4aD4aC3hTdsq3F2IWknQD83Lf/
	3JWaE7uBZijxVAml8vxdsfwkO2+gnHRFCiQrlOutoBbleiTw6eGF/+lZTGOV3frQ
	eIdHEg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eyssr8n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 14:53:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216728b170cso112122505ad.2
        for <ath12k@lists.infradead.org>; Tue, 28 Jan 2025 06:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738075989; x=1738680789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AroXVuyqk4ebuD7fOzoCQq+wPsBrvou1mnrYuKOiENo=;
        b=fXDm0O4MnnTVuylr0ytECC1fxkcbmk60EEiGHR/qVHmYPmo6HjlIZE0DBORs415Pgf
         Gq8042JgvuDdGhOlUjBDcOtzXpcZ8pdAFDwmF+nG1h5qy0A93KSZLZ6vj/NHldDtZaeb
         aWYWmaAdhJDEHKOFfcfPsXF7ND/uLZP787fME6JNVvd6YZV89PwJ3Mw34a6pL+49rf0w
         JREdiPOKvjBdY6A6Q9F2PMMUfyv1VT2TxDC/Z/G2EEM6KAeYV5h8q2zghs/av0TTZua5
         1qeMfXSrsPAzcek9KN89KSm7k9H7awC6rHx9n0IhMJ1s+CfOeLeUtORRPULYWXrR/QTP
         Kc4w==
X-Forwarded-Encrypted: i=1; AJvYcCUnErNLH0VrzBZlp1OXP2bxQ4GqfP7IfdatlKDd9pwBnfEs9izxsYUriJ7UGOk8Jp3aTcbtA3c=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjg6zY1EhosyvoE7CANVmmAMjqmCgQl84uVx1r36DelAIPxDdH
	rZ7mbJptduVoWFLQBLzy05wjNTn9jrF5z7wlIN1Uq3K/wTvK602NZK3fDHlTODfnLFbdg7MEctA
	BcpyDmx45XX3M1rf0pQOTTHK5JvNlaZe3TcPwgxgFgQx4iTuDspozhdlthBWt
X-Gm-Gg: ASbGncvVfTff7ch+JDxfarrkc8cHXAdX1e5QYdhQ6HBFC5ubzYi5d8nBe9jFOBE0iHp
	MxkerQ8DZqgsRhYPrjwybxtqHWG+xw/OBLbJcU/k3Heg1fiM2kQ0E1Un2YagKCpPtuQUgsgbpRB
	RpTZ4Up/4k7mPOfaeGcXCP8N3d3CmDX0aVJGBq+ppboINlTkn0PFQ9Hi1LTXiYTDg8bh0bPRJZs
	uZPwSosUH4pzugoGk/MoWHDsPJFKDTXlXMYj29OWqrR+mh2LFGKIsAysWlcyru8WzJdRQYOj+44
	/m+Zufm/z8RM1unBAOeUHCk/ujFbEzC/0JpA/xpMHQ==
X-Received: by 2002:a17:903:11cd:b0:215:b5c6:9ee8 with SMTP id d9443c01a7336-21c351d3065mr599704615ad.7.1738075988828;
        Tue, 28 Jan 2025 06:53:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDcEM2Qm5bG+KZ4ryMMgVAQ+hzP7QUPCz3RjLizBOlvoq8EQ2pMKpui4TFDRtskPfJJooU7g==
X-Received: by 2002:a17:903:11cd:b0:215:b5c6:9ee8 with SMTP id d9443c01a7336-21c351d3065mr599704265ad.7.1738075988459;
        Tue, 28 Jan 2025 06:53:08 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414cb74sm82366515ad.161.2025.01.28.06.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:53:08 -0800 (PST)
Message-ID: <cdbdfc44-849d-449b-8c27-c175344440b6@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 20:23:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] wifi: ath12k: Add Support to Calculate and Display
 TPC Values
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
References: <20250128111059.1690113-1-quic_rdevanat@quicinc.com>
 <20250128111059.1690113-3-quic_rdevanat@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250128111059.1690113-3-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QI5r7ME8YFWx4ZGkbmK8RTpwun1c9mYB
X-Proofpoint-ORIG-GUID: QI5r7ME8YFWx4ZGkbmK8RTpwun1c9mYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_065312_077049_45D66162 
X-CRM114-Status: GOOD (  11.20  )
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

On 1/28/25 16:40, Roopni Devanathan wrote:
> From: Sowmiya Sree Elavalagan<quic_ssreeela@quicinc.com>
> 
> Transmit Power Control(TPC) stats should display per chain TPC value per
> radio. Add debugfs support to read and display TPC stats type and TPC
> stats. Take power values for each preamble type, rate and NSS combination
> from a particular index from each power arrays based on number of chains,
> NSS, modes, MCS and tx beamforming enabled/disabled parameters. Minimum
> of the values taken from reg power table, rates and Conformance Test
> Limit(CTL) array table should give the TPC which is in 0.25 dBm steps.
> 
> Sample Output:
> -------------
> echo 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/tpc_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/tpc_stats
> 
> *************** TPC config **************
> * powers are in 0.25 dBm steps
> reg domain-22           chan freq-5955
> power limit-126         max reg-domain Power-252
> No.of tx chain-4        No.of rates-1164
> **************** SU WITH TXBF ****************
>                                  TPC values for Active chains
> Rate idx Preamble Rate code     1-Chain 2-Chain 3-Chain 4-Chain
> 4        OFDM    0x000          39      15      1       -9
> 5        OFDM    0x001          39      15      1       -9
> .....
> 12       HT20    0x200          40      16      2       -8
> 13       HT20    0x201          40      16      2       -8
> .....
> 44       HT40    0x200          88      88      88      88
> 45       HT40    0x201          88      88      88      88
> .....
> 76       VHT20   0x300          40      16      2       -8
> 77       VHT20   0x301          40      16      2       -8
> .....
> 172      VHT40   0x300          88      88      88      88
> 173      VHT40   0x301          88      88      88      88
> .....
> 412      HE20    0x400          88      88      88      88
> 413      HE20    0x401          88      88      88      88
> .....
> 508      HE40    0x400          76      76      76      76
> 509      HE40    0x401          76      76      76      76
> .....
> 748      EHT20   0x50e          88      88      88      88
> 749      EHT20   0x50f          88      88      88      88
> .....
> 812      EHT40   0x50e          88      88      88      88
> 813      EHT40   0x50f          88      88      88      88
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan<quic_ssreeela@quicinc.com>
> Co-developed-by: Ramya Gnanasekar<quic_rgnanase@quicinc.com>
> Signed-off-by: Ramya Gnanasekar<quic_rgnanase@quicinc.com>
> Co-developed-by: Roopni Devanathan<quic_rdevanat@quicinc.com>
> Signed-off-by: Roopni Devanathan<quic_rdevanat@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

