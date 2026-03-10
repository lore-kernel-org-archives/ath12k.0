Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EAEFD2D7B
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=; b=ApfD7QxhYSGCypv267wadmD38n
	yQf7M9mEP9NYvJSEVQLFm+omQcVi2Jvif79ZXY5P2Z/NESzyMAjFhwSyGwjEIl3L/+SLVhVZ81mWI
	F/uOx4fDUED0CNavuAXswl0uXPfRDfcKUwZlDI1gs1iJXmYPYwZKBsCyJ5O6yoolCvQBPpCNJNnHh
	lofpMl5agssrFMrNekunclpW/4rkIEp89NSYy21vpVeMkGLEPs4fy6jESQOp6OdTr9/mfPtlI58wv
	rh7T7jpPBaIXLM+7uYzLxLMSvWtyGzKPnchf1PrN1dxM5zOwZYUZT5g5SBLMPtXU0nlZiSPzU3bOU
	C6F+vsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzx3t-00000009aVW-2ZfJ;
	Tue, 10 Mar 2026 13:23:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzx3r-00000009aUP-1p4z
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 13:23:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaW4C2861962
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 13:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=; b=pVrXf5o/EVBmE+wg
	BT73Rsn6SpKJ5wq+G76Ylf7BWahcXxLYD+eUmWPFXcaWhkwUpobx5lK3xRmxITXS
	bC+3ReO12w5lG0ypF9by+SDzV7dKvczmi4V1ObY+HulYNow/9x+coIgQOc0FDR5z
	tqh/NwxX4y8wUkQqnAe2Ol0tx6qnoYrTNmZo3PQbWnPYlAZ96o/M5CShmfzCT3Q4
	AKPsiGpksVlygVdcqY4yPVfjY54SOoGDSeJUIxOABYkWnjdZlzq8wUrR88zzeQ8x
	0ey8qW+7bpHy0Tuk5wPV+wlDXL8O9vInB7v/+JNZUUTfdiow3BeHh16CYZpK3pDP
	/hjuyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w9gh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 13:23:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd409so372266385a.1
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149026; x=1773753826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=;
        b=UEeI/gTCrDt+UZ7E1O8Ka5gMRgfGWuRacpG8lcWU1P+EgNZEA0AYHqKWQHqD65G0e9
         H9WlipCWFEeERAo4MHDev+cigse+Jf/C2/0n6LSwY1VlwCFtYLC+BHiZVN+MEkEMsK4v
         7P5Y9vnSBBYS1l7S7MLS3XrSYaKyhoTtBCuS1AWo2pgMxdLaTP2gHv4JoThhYM0dLo2n
         pO+IPazVElyMvLdZIGv6ExvdZW/xyKnmH5Y5sboMHKnaCYQt2yOd8hAD537zMQ2yYVRM
         FpJLfQv/S/sPnWHHokd1qiZ+L7E8nuXakZjjdCEy27BP4jZEoGNNyBRgym7FbbMLIQ8I
         Cf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149026; x=1773753826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orEohHfy7GJzc6faGQD96uNhCW1mOo5TuHLKgf3TG6c=;
        b=VQfASaCOQftGbQjftdeVH1ZcdtxKcq9hg/Nx1PggbLTtp8o2CLKzBfcF9DoAYrV6No
         84ZvevXlS3L7qh8pHJkBKhF9l31RO/Pfc8GdXZOiYz5FVihiPpnYD2+gIpgjKWgE1xWe
         ggW4IXiEqwhISaXdJijnYsSzKb9YHvWBTNjZMCdjQ7aABFqUG7u2vsbRD55Ki+iXmk+e
         1lsxcxLERcXyyQovRaA4OVGuIvG6Cx8M8M7dnKvZdylRRUql6K21Z7NJ4QzcaczT0Szi
         IDqnJVlmOMDgRMB3dYTxCrOy0LN6xnYqZHVhP9A7N/rd2dBlv/AwG4k1Uwcuvv82ufTR
         1QQw==
X-Forwarded-Encrypted: i=1; AJvYcCWK0o1NcyEtpoz7NXoh328UxFUIHuWNHmxeCEcJgdRPQXHEP/E1L61TaM41K8HhStCBOBi5wQ0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb2rFGFQ/tglbHK98LLou5Q2k3JI2XxafHSrzGCAsfFBmfJAYn
	Ly2GOyqx1wuq6ktOmuK9KIEFDIrUPw8wPh/l1eaLgqFadLJlZsZVqpxMPUBTzU9kgmlE7ofRxyy
	Lx+T2jfCq9u1M2Kw33A/1I1duJIoOvp0Z9QVyaKWVxmBbvJ9C+JG0NYdGaDVglazh
X-Gm-Gg: ATEYQzyGpUbUbpbfk4r3V9XUwrst9w1nngemdOVTcoLgIPGI4owrPE8J0si4NDv2miu
	rUGNPMhQE+K/dJy3jVvds9iGXiS6iga2zWT1y3R8PqkT38J0fBJAC7qym/cmHerbRiMshhAq7gf
	FNYEHxIQOlY/FvRmTUrH1KVL3yVjNuywseSbbS5B6BWzK9KfbbcYxP2suN1qH0noc+DwRDJaTTr
	BYP3u6+JFzCyMdCyg22mVFdaSEKrnG0mfcqsHYsxNtluZ//zNqXDr0lTp4A2E/jeNFSSRYcIL0H
	2RXeqHzSwSH19Zq3FH0B9rKQEQUJaINlqNBu1SlZQq7pHiKaA2u2HY7Ppn4vVqTGnbDvlEVQHLq
	nqKP6qL4X+y2HJvZapIbZnzAeLW7r9/J2Gew4sF8f+R0gPWzmYY/9DskdRPwEHDddMcQh9hTJt6
	id/bhzt8RI
X-Received: by 2002:a05:620a:4507:b0:8cd:9938:9809 with SMTP id af79cd13be357-8cd99389e77mr147057285a.26.1773149025760;
        Tue, 10 Mar 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:8cd:9938:9809 with SMTP id af79cd13be357-8cd99389e77mr147048985a.26.1773149025121;
        Tue, 10 Mar 2026 06:23:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8da01sm37186097f8f.1.2026.03.10.06.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:23:44 -0700 (PDT)
Message-ID: <8ad5ecc5-ddd9-4d79-acca-41b3797f0f3c@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
 <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfX8OWuAVF4BJi5
 QdWNTo0sbVhSjSvEPUPd3x+D3zsDLKSiRtA1V1Nd+Wx02c6ltOTfl/+w9OfO4DcA+3UCyv9HKIM
 S3BnQbvAPV8FkmJMdWZDd37xc0RDS3Rb6eGJH/+hyuRCxiJgKYK6OMvCPQTou7X2+7EOc+scBBw
 bKVB5pvedB+5Jb/pASutecCHa+UsZ4VHZ4TJuJsFHxSTzOP4KEd6ltGfmU5Fz69Ys9ZTbb8HLYR
 pjgGwBFu5h8YV8f6qvtp2NcJ9d9lMwMDH0DvEH89BRutcNPpw1qOgCY7lfX9dh94KVfoXHMGIEE
 Unt7p3z5x505DTHoRLc0E87HigTH2SQIMWNGkbiCTFuJNJLNwhMVocqySbMcvgU4bH/VuPEGI4h
 zl24qbfpnWfKnoftnQn0mz0h2CGkaW990XM7iRFetZEJQPTPmEZ+WqYM2twG7krhadL5FkEqgyk
 gi+wrvIL1qh7YS3Z1rQ==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b01b62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=M45qCTXPNjoLw3xkhRYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XS9S0KMtUW0NIeFBHlUrHg0EQA7YwiIA
X-Proofpoint-GUID: XS9S0KMtUW0NIeFBHlUrHg0EQA7YwiIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_062347_489040_A0AF59A8 
X-CRM114-Status: GOOD (  18.39  )
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

On 3/10/26 10:57, Konrad Dybcio wrote:
> On 3/10/26 12:03 AM, Daniel Lezcano wrote:
>> The QMI framework proposes a set of services which are defined by an
>> integer identifier. The different QMI client lookup for the services
>> via this identifier. Moreover, the function qmi_add_lookup() and
>> qmi_add_server() must match the service ID but the code in different
>> places set the same value but with a different macro name. These
>> macros are spreaded across the different subsystems implementing the
>> protocols associated with a service. It would make more sense to
>> define them in the QMI header for the sake of consistency and clarity.
>>
>> This change use an unified naming for the services and enumerate the
>> ones implemented in the Linux kernel. More services can come later and
>> put the service ID in this same header.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
>> index 291cdc7ef49c..b8d07f2c07e7 100644
>> --- a/include/linux/soc/qcom/qmi.h
>> +++ b/include/linux/soc/qcom/qmi.h
>> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>>   #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>>   #define QMI_ERR_NOT_SUPPORTED_V01		94
>>   
>> +/*
>> + * Enumerate the IDs of the QMI services

I've the same number of patches fixing the copyright for each patch 
touched in this series. Shall I post the series separately and fold them 
with the corresponding patch ? (IMO the former is cleaner)

