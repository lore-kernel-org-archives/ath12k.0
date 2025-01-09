Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C06E77199
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y7zaXSi7gZ6s7ePNlQEwcjv5qGnWP1LxEv+a8XnG8o=; b=nD2PJsRbu8wqnm8U6z5ZqHHqfr
	p/79j29Sp1xXtQG9SPS98Q7o3uXo7VrYV6zb51SriSHPo+JGWTK7tlLERd14oXeAbg6jVosMP/Ax6
	iQcZjSAduAb4eC4YuWDqegLiYCrEnYc3eokS2djeEVnHnINj963xPcIe12gbzt3nDKTFOl8eGVafW
	2/I8VXQIUqSf9vl8PYSgskpJlZ+zOrFx2nb2ZZuNnN7Ki1f2CjvW3L6vsM/rSM73U2xay18ziOnwL
	I9oGafGp+Gk0CkZTWReV/0Kx0OjRuH5JPACQLpJvO1rGYEMByv8T2OcKXJy0ZhGFbvVpp8X6ecmNG
	WRTAINdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzlA-0000000DJqx-28Jy
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 21:08:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVze3-0000000DIyZ-0msS
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 21:00:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GWjed029049
	for <ath12k@lists.infradead.org>; Thu, 9 Jan 2025 21:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2y7zaXSi7gZ6s7ePNlQEwcjv5qGnWP1LxEv+a8XnG8o=; b=jF7FVezUXbFAKuHb
	2F9OKvAXJwUV+3as0ipu+MP7xvLBCIMiGYTfIP3o44mdpR5etGUs3M1jM2xW03Up
	bNq+6rsCndbakimLzWGK2/jScthQC8pE+5IbzVFEW3XyT0ZQvFUxqRk6QbYfFxuc
	2nYo1IKrLLcnFW8YW+fwYjlZpE9v3liTbJ6cgcTARMiVpvc00Q8MojvcZ7tVpYln
	w76x1Io5OWBuxCg8xbRRBNu9K6eGtwCqjh0mC8esPEp5289IkKr4fxziX6ewSCDc
	YL7/6opy4qO+Rb1lBYyZC+KHsSDVwoOe9/R0QeXfhZ/B7SL7nTiwfA+QvR/vTmqf
	GPGQDA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442j2rgjsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Jan 2025 21:00:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216387ddda8so25130705ad.3
        for <ath12k@lists.infradead.org>; Thu, 09 Jan 2025 13:00:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736456444; x=1737061244;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2y7zaXSi7gZ6s7ePNlQEwcjv5qGnWP1LxEv+a8XnG8o=;
        b=qOUv1wjCTtjTQXBn0PIDjg9TIKa8TNF9NwSCEWsHJirs+iMMLHu8Nu4SfRmxSdBsbu
         SbD3ZN2EvZaKiVX3W1rkFiwp0liS6rYnSYPB0n/UBRE2SldWE9Ndzj+f//hJnY5/OB45
         GA2q2TJeQhB4jf0WCz7JI5gH90rUJH9RqMwjv6Kef58pY42bhu17rqOQH/EGkKT2oYLW
         FbGRmnTZtweRokWC5Rncjc5G4P4tGCACyW8LiwTxOhxahP3KFC0CaSv7b3FTQGZccFej
         +gVWzXKPVigGEOCMz6Q8HIgeRhse/JwfPSTz19okcP5tHjlVEOIlv7NKV/sRCv+VDbLC
         kXeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB1IDcsb6u1HRz0AbZvfQr9xNxCYZB0VLe9hXxI4WAQOx5Vq6H6UnKEIB/59dqb0SSiZa2svM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvZb2LRSR7EH+KBZtnd66Xb9YxVEa0kQoh+k7Vlb/ZVzGtlQzh
	Q/cdpM+wZMFZLIUghbGJkB4MUKX4RFvmRnJqK/VwC8kL/sLre9BubfTt9xc3eBOQxPskNSpOzOp
	r8ACu8uA6o098HK0RnrxaXvps7Tx1Ckxqvii5nzUOSt+53HSZDcde5VaEsuTn
X-Gm-Gg: ASbGnctQpx4MwvRBAVnycsPP2i6bWcLsJh+XojajQUeGUcXSVm2ary849+TTPUefKlX
	vFz4mR/71fCs+VOFRPmvgnGf9U5nkCGHmo/Vg5b+Tq3wxDjAq0WCRXBM89U04E7BL3X+jN+4IG4
	6pDwWQPhardAyPbMSGHYUH0kKQOeQsLW21cGAMH23s1yfUCMIXSLwzpAi4/IeuQAkz+SaYRAyUv
	FR9LW7UJoKE2AKkO2veaUcgQEhB1DhNkAFHNJLYary3PpJR4+p0qxoMDqYZ6TlY76two4zGpunE
	5nrYB5UqXdH4AVnQxBduGQksUPhy/bzHv/nh
X-Received: by 2002:a17:903:1cf:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-21a83f4cd36mr129741185ad.23.1736456444315;
        Thu, 09 Jan 2025 13:00:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPR95QCCAc76At1lFc/1jm4USSn/95SsQYqfRmZvn8eP+T8Lzzbafcqg4TZqQQcedWEHoFOw==
X-Received: by 2002:a17:903:1cf:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-21a83f4cd36mr129740505ad.23.1736456443747;
        Thu, 09 Jan 2025 13:00:43 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a34e456sm4450099a91.35.2025.01.09.13.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 13:00:43 -0800 (PST)
Message-ID: <dea8d952-92df-4a7c-9622-288921b23332@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 13:00:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] wifi: ath12k: Disable MLO in Factory Test Mode
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
 <20250109183551.1028791-6-quic_aarasahu@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109183551.1028791-6-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wwGMMje3PuBby1oq2tHDJa6rUBef8MWU
X-Proofpoint-ORIG-GUID: wwGMMje3PuBby1oq2tHDJa6rUBef8MWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=820
 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_130047_349432_83E8BC1B 
X-CRM114-Status: UNSURE (   7.26  )
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

On 1/9/2025 10:35 AM, Aaradhana Sahu wrote:
> Factory test mode(FTM) is supported only non-mlo(multi-link operation)

only *in* non-mlo...?

and s/-mlo/-MLO/

> mode. Therefore, disable MLO when driver boots in FTM mode.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>


