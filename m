Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A07C02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 22:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVfW5l6eIEIR+q6qj/PoX42WlbginBeQXhVPPpkf0BE=; b=TWN0nVXDvbY5YeUg3G8lghT/80
	2Qmu1gl8IuhgoDxZLfIwAru5vhNFVTFsoY3DnRHA241x95w/I1+80HJOlypgY2CHoospaUJa5I7PE
	iwqUCEfHnRc5vAzSSNOQqA13iXjRVEX/hqeuZjfdjwSn0/g/i2iDWfWKY3b3nEQQWMn/H3hNggK5h
	CNoksEPm52abROhYepThyzwvJifnAL17u9WtOVaDcITkBNR8NJBPTd/3QYq8GE+u7WmkILae6P9oI
	FjxeQy/7A51YJXtnuzPNdSyE2Jf09Db5F9yAufmAH6H1c3+BDBIEUIPIzXvX2fsNjp3TJtpwmBAE6
	vI4BVWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXT4U-00000006rRK-2BjK
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 22:38:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXT3x-00000006rN0-3tfG
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 22:37:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DFSHSQ023447
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 22:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVfW5l6eIEIR+q6qj/PoX42WlbginBeQXhVPPpkf0BE=; b=QpY1mpFLF0Tq9+lV
	PX9YEixhiyou3xrMJC2S8MXnpRB6t240NFZAjlXFueeFG1ntR1kM7RQikXMgCWZL
	RN7Rw9+ZxPoLjIDfR4EvYeIW9wgveW2t44EbnLs9q6TiN3m5jn8Jchy7nXqKv0oc
	frN5TeSIlqyPmFOzWZizG0OeZ1zmVZHSH5qjq5pXW3kGiZJqjF17md/pcahQzR33
	GJjeZ+HtGcYGOxjeLSWna1oPnS/io3Xe69cKGOAdnEX3CLEdWgHDzPBoJsJceqiV
	xg9moS2IUopyOI/nw00b1ptY6zCFy8Wd8Ykb2vz9cUvMfMaEZ3FkjiUfHh3utQPI
	4MnjSQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4455gfrxu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 22:37:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ee46799961so12529686a91.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 14:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736807856; x=1737412656;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVfW5l6eIEIR+q6qj/PoX42WlbginBeQXhVPPpkf0BE=;
        b=by20qIctdAoPTM+uJsdhhlVKHJsb+IrZv1PFeBp/t3G4XZghhXXjGxGQlUErjUTDLk
         OubJMpejw/RCQqydWONOzc0pNwRkbjDT1QOyCLOslNW0GB01bZZjK05rsydEOWMA6cBy
         dB1V52DaIiKjoYt+9Un9nTkgsaETQdF6XTFuQ0Dv/3MoBqNTfI4NEfBvFeR0mXLNgJ6u
         J3nv+bxYA+5E8lMfETQ6dLNLLZYivsaHbqfgznpgT6oU0z09AoACVx5C05Y2xdb+ZHsb
         HDNhGWev6KUygKwKyPuf1OeTexay9EAa/QgqHM73xu2V2PeJESIHpHCPmUKHTwIRO3Uy
         5b0g==
X-Forwarded-Encrypted: i=1; AJvYcCVu6EgUdmynMuyC7hXObY6nwsR8Z6oire4r1KjqAcNILpnBmBD8KoxY1WSsXbonYtHgnVk8Kcc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfV0LHqpUieQTkdMT5bxYCjoWAoO74BIfONEt+yGBqUFuQrqGQ
	qOCU2ZF9tE9XciEocxO0LvSwi8631OvMjaIVB0VTMjQX26tGcdJalcNC3Gf8cM83Mm8Dlfz2gBq
	Xu1zcww2xS8w9hASgXUh5hiaAZOlSl4b9evXc+IhWo54K7fOu17UvKWaMRCMx
X-Gm-Gg: ASbGncuyCtnYwl/D62VyODpG2NZrWXyyekmvYZoDlhRpWwkcTrg+xpDPu4GnShYFEu5
	FVVcmBpDa8TaBIzhuB7ss6m7PtjpcUMl145ZrtOt5VGdzYTlHQNNEAts4RhOcjZy0UMfGX1eaBR
	nxXnGdwNVu3tKB0Oug19G4v06usgAYZlqO6o5m1NF+36NKAW8FIhXi4oaUocrZHeTS8M33Z8Ww1
	6OU+w5uxFH+VZfYL/LLqrGdTQ93uw8I1EduGjXvkwsemrBozRHBxtFmjetPwFZWvmxnNEqijj15
	uHlfV/crwnDP3or+r9KEBG5bzVrwS/KZFhXBkrvIzcXCXX6CPg==
X-Received: by 2002:a17:90a:c2c8:b0:2ee:70cb:a500 with SMTP id 98e67ed59e1d1-2f548e9a4c9mr29194585a91.1.1736807856358;
        Mon, 13 Jan 2025 14:37:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqAOpkaJHOGMK7Kxzat6ZhU8cB+zRyhJB14tfQHECRCtWKIGg2E9cdpicxH8fVAYXwhfbDKA==
X-Received: by 2002:a17:90a:c2c8:b0:2ee:70cb:a500 with SMTP id 98e67ed59e1d1-2f548e9a4c9mr29194550a91.1.1736807855929;
        Mon, 13 Jan 2025 14:37:35 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25c927sm58256305ad.228.2025.01.13.14.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 14:37:35 -0800 (PST)
Message-ID: <dbccf6de-55b5-49e5-abd8-a507206b6668@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 14:37:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: handle
 ath12k_mac_ieee80211_sta_bw_to_wmi() for link sta
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
 <20250110-fix_link_sta_bandwidth_update-v1-2-61b6f3ef2ea3@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250110-fix_link_sta_bandwidth_update-v1-2-61b6f3ef2ea3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K-sCkOOg2sjwrakhs5-4TF3DOTGDc_KV
X-Proofpoint-GUID: K-sCkOOg2sjwrakhs5-4TF3DOTGDc_KV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_143737_991603_22837E79 
X-CRM114-Status: UNSURE (   9.96  )
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

On 1/9/2025 10:43 AM, Aditya Kumar Singh wrote:
> Currently ath12k_mac_ieee80211_sta_bw_to_wmi() handles the bandwidth from
> sta's deflink member. This works only for non-ML station. Now that MLO
> support is there, extend this function to use link sta instead of deflink.
> 
> Additionally, in ath12k_mac_handle_link_sta_state(), the link sta structure
> is not accessible, making it difficult to fetch the bandwidth there.
> However, ath12k_mac_station_assoc() does reference the link sta structure.
> Therefore, move the initial assignment of the arsta bandwidth member to
> ath12k_mac_station_assoc().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


