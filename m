Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16D6C021BB
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZDVrOfhGJwI3TSbSIuZAzkP2eTAltfjgpAh9EQGfog=; b=yBkmBSo9nsXLvaqmgxoABEXq37
	4QcNCW3Mn+MMc/Bw+f2OC5wIiFGU/D1Iok6dDiDV4OlHJLlKXH6wm7BarGhPg2xzite3cjhJEUX21
	T8hvZzEC1xqlHpzNr6vYHqwpX7Xkbo03nPlb9MwpJbKSqLlioh+9SNnS0v1p//Fhq2kLxislgulXo
	1wb1VJNPT0Ni5wDP64ma8qaNMKXiNhmFp95v5Z+XzreCLi3Alo7eFSQSqcIAs40ZiZ9rPnNrYEQqQ
	Pj23cHE5Q8Q8epUWYYKoheb1CJWmNPjKUzxkvvo2MtfxKK3UXqQLJtayt+GLBmPSwitx6R0QJnpVE
	NgpWeCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmz75-00000000lL1-2DM9
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 17:52:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy69-00000000Rut-43fr
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 16:47:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8mTAO032187
	for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 16:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZDVrOfhGJwI3TSbSIuZAzkP2eTAltfjgpAh9EQGfog=; b=ZfWkPO2te79Al0Cq
	Gs1OU6yTBTQU5uA7j3wIsU90Kk2jGp6AZ7IzjJApkcIqnbN5SiRyC5qvu4OYr8aC
	lJFBPhX1iwt95jgOhxkUARQGua9ofW1i/NltO9BLxUvOLflUGGHhG0XR1m6wEM0b
	p43ovatiNfszES1CMRavudjkHgYi5SOL2+qTZEFOUgPmBAx+/ryNDGWcavTsxexe
	Ez8Nj4VOaroLWQZLhQfiwjuxLbVowtqe8hwqmYm5bCHEusWhtMocUvow/AzBJ++y
	5GTDImaA1YybpbJfVJI89mIUe7DQABX6SurWTDoixYpeCv/YwQypoXsDHRVo9Yd5
	rAQyVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6nu1jb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 16:47:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fbfa786a1aso19221374a91.3
        for <ath12k@lists.infradead.org>; Tue, 25 Feb 2025 08:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740502075; x=1741106875;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZDVrOfhGJwI3TSbSIuZAzkP2eTAltfjgpAh9EQGfog=;
        b=Bg6GRGH6mh1xzas50WlKi86gfzIRCQc3V+HKSv2Mn4Rm0T3KfRt2w1m8jUw/emTmw4
         Fr68u5TQDghw6usWWDnoLIx/BbqJddWycnyLrCTaA6cn5i11IEikUOBBPOEhum3ESAzz
         L6YYPPNN0MM7VWM/xkVDw8cPP7yKA4rp025agldcM+d9vn9mM1eLCG7teppT2z3yAHx2
         J7qWcIrcSzffGqBLWUIOgnmbd35NQzY2bf7ViJCISFp7RTZQ1TALFJlzA/UjRvp/KY3m
         CGmfY1Mm3NVzqiToPJFIOc5321xP4d479VpJGTLMwnvyZ+nczsO2hvlh9OcS68CFSK1j
         X0Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVIPreXm+uQc98RWntJM6sTFCL3npMhZpaomK+RxoBNoGR6M8+xPtSrkL+YIA+UwOWFvTx84fA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIREVorl4b89egUYQwslo+Lzl/HyhIvdJ61vpdV1WvdYTgrlyi
	4H/LMS39ynbWhJ+ct54+/eLx12Dk/heP7fbjVlu6FnWwhKn+hIcEklE9pANRpjCOgZOCpK2E6So
	UUzz7EoCLqqp7iVdCkJVZQVqwyNYso4VT6UwIpjihXp0Q6+Ztn0mob4z5nH0c
X-Gm-Gg: ASbGncsUU25a4frRmydOnTG4SIoFNXx68P5Vldz49xYl0QfFGsWr0Bsd/HIgHfKawL6
	7uYlXBcNrrlzTH/2M0el5efosn3tnRlOYObtiHMis53sUF61T+2HleMIRuK9brpuxFf8HEoXTYE
	gOwFmO9yq1tFgQp48ZQnkO9YzQEyRg6AN2ebTjKS4ka9hn7K3vQwGiYAwcj/0+v2IPmLVGnNfY5
	W/Crpsyh9QbUUmgqAT85r7h1FKRXhLveBA4kIwKW86UMSC8kNqP+kNz4752ISDyJIf4pUNS+c9O
	IqXGKhX3DPg/KIdC5j93ddtXNQDnbo0l7tNka0dVra2uxkYBJrUeuugyY19yVchxcOk8sVs=
X-Received: by 2002:a05:6a20:840d:b0:1f0:e547:2a95 with SMTP id adf61e73a8af0-1f0fc77fbc4mr7690914637.31.1740502075586;
        Tue, 25 Feb 2025 08:47:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdPfLWKKNqt+lqaJWqGpH+fK0ZqBAaMQEednaibGK9nTCW7SkhcF0zLldZAyJp0Yf7PYgmjA==
X-Received: by 2002:a05:6a20:840d:b0:1f0:e547:2a95 with SMTP id adf61e73a8af0-1f0fc77fbc4mr7690858637.31.1740502075031;
        Tue, 25 Feb 2025 08:47:55 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aeda79a23dfsm1367185a12.21.2025.02.25.08.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:47:54 -0800 (PST)
Message-ID: <c2b540d6-a30d-44e2-b928-4e95a78d9d6c@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 08:47:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: ath11k: Clear affinity hint before calling
 ath11k_pcic_free_irq() in error path
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
References: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
 <20250225053447.16824-2-manivannan.sadhasivam@linaro.org>
 <4dc9e860-7417-480f-ba89-439498138d3f@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4dc9e860-7417-480f-ba89-439498138d3f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7QsC-IssR1bepXHINUMuIG3hTM4D2H6s
X-Proofpoint-GUID: 7QsC-IssR1bepXHINUMuIG3hTM4D2H6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=782 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_084758_132844_B8604900 
X-CRM114-Status: UNSURE (   7.30  )
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

On 2/24/2025 11:23 PM, Baochen Qiang wrote:
> LGTM

Suggest you reply with an official Reviewed-by: tag
This helps build your reputation.



