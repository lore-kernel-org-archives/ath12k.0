Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FB6C282C6
	for <ath12k@archiver.kernel.org>; Mon,  3 Mar 2025 23:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hStxONONkWzSFmX4euTz1D7hHThMLmcZK1Zq+P66Us=; b=zPU065iB4phYgZvtle2u6GyWDW
	K9ixvK0C5cgYVz5MA70DgTrbqyVONo+CIt9b01L9N2cFkt4uBqy9LKMG2PhkjwkihKS/50nRwycMq
	ULnN23AgKiQ6bpSziumXOLcQazZjrbNywdiMzCEswkK6CR/9HU9LOYzqx0sbE2SPA3aDaaNsGqj5V
	fndhcSyNcZQ3ePZ0FFMEAVar2FOamsBVgDSQNueGHUwFx2WvLBLQbDJwAdV/hxUGaYn/b6v5bSbGD
	9gXKkwKZJuJNNoVUsvxtudwVOlWYF37NFcRV5QXlmh9Xy7E7U3nk50PYBXEqbZDob1l7krcrOqidx
	6ju7WUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFHY-00000002ZL0-2HhT
	for ath12k@archiver.kernel.org;
	Mon, 03 Mar 2025 23:33:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFHV-00000002ZKf-3c9E
	for ath12k@lists.infradead.org;
	Mon, 03 Mar 2025 23:33:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NX3gb020938
	for <ath12k@lists.infradead.org>; Mon, 3 Mar 2025 23:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hStxONONkWzSFmX4euTz1D7hHThMLmcZK1Zq+P66Us=; b=CFruHIQvqrsMtcSa
	g00GUWFXyx7OL3F28lsj+K58YvhVn2sjrcIn0+U5GwJF0eiNMy26Ls+ZVHngTB+i
	RwsrXU0iJr5hzROHqZ8GZIqSf0lbRhW5tJ+Hq43I8DoXgpeAgGHDXBm56eWg1ilb
	M024/KZkPLJqCy/7/Acpt+yCuQSo2C/143Fn1QDToNgZUl9sd/ow9CxK3BdblXOo
	w7GB9Lm5MzcHN2C06euoPjf8tU69mRdjhDtYJplp7kAnvP80BAzA8T/aFKP87tnF
	KEq+3BZW1LFXt751WmR5747eMduLvt8Zd5xb/lKtaPxdSP4RWV891/YsL0ro3II6
	oUvulA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tr005-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Mar 2025 23:33:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2feded265deso4167600a91.2
        for <ath12k@lists.infradead.org>; Mon, 03 Mar 2025 15:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741044782; x=1741649582;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hStxONONkWzSFmX4euTz1D7hHThMLmcZK1Zq+P66Us=;
        b=cGLYdYSd8vhzSnvQ71Sqcf8/zQeYcZUTzIa/ZxlBc+Ao7PWQrG0BhuAArCsVuSAatK
         FAoZjC+TwdgdHzEUXGW3bv2/zhQ1rtMgOEe0dYDvFs5I0YPRSGcaOhW8NkU733XXfIHb
         DOvk4Vnrhe7BwbfZqVXBxIY+xxIfWejV/RY+N93x7bolrDRy33c8ImcRHPOFRzvoHXJS
         hzn0938xFpcHjEV4OfBxcuF9nhZkbUW9op8qjhZzO+xoKk4Zgq6W5LA85jPR0kFkM2fj
         pv82rALQPO4QaeNK1gBM9c8LURtHMdkMkZV996vO43jkq/18sIPV6PRGuJWJlTsg/iQ7
         vA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyEvlUs0G3dDc3Xos8VfzoezrEfy5AbD5FpiAgKe+iF6/arVGYe2Yu5LuvR8YVxdOijRUfSf4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFY43bHqBuVTzcBIP3WYnDMak95/L/waD1YxxQ7jgjyniF/CFy
	c6D4NJOs8FRhajf6SePedlOfDEzDFTwEn1xuOymZNKXqgHZfDAp2o4TMsPEicVe+T0rEpbuxS8+
	E4eVmBnDxTV2uyYdyIZcYLTLrnOfsmXSeTrnWvErqVI9YZ+bhqlRREqu3GyxC
X-Gm-Gg: ASbGncvqYodcNbBYstEfHy+dWq+liPr6wm74+ZT4dl1ebBDvZAt5bzQpkVl2cGw0Sbh
	5fDGKdHXz81iH01Ul/X9WOojQhzbH1x/syH2niD2n5B3c71gfpV7gOuq+4papKl4sXwQe+7jiH6
	Y59L72nBmZOi+VJNuSZsW1o56UYn8UMBl9RHzjiUsFrcSq7/p7/Fd4OlKvewQjWWbHsOiWJhZzU
	X6cO/gsJneKXxEinw4oQiFUHsnfhW73+BkXTc7R03FAPzyO9Z0/IHvZA8IiAuapZZ6BEYKIdtUv
	kbBUp1yaftXhNHvGvoMoX7j4/OW5RTv6UvBcXj4CBOqpuRzWjO2BSUHR7opGvbXkVAjsBoXIPll
	tX4IuA/nu
X-Received: by 2002:a05:6a20:a11f:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-1f2f4e73bb5mr31456090637.36.1741044781849;
        Mon, 03 Mar 2025 15:33:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYEIC9GIomQlA8PtDWhumRHgTkORsl3eKRkqEgrVvn+rFRo6ZnNJ6yNk77zuHkGDssT3iaCQ==
X-Received: by 2002:a05:6a20:a11f:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-1f2f4e73bb5mr31456055637.36.1741044781455;
        Mon, 03 Mar 2025 15:33:01 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af221346042sm4863866a12.28.2025.03.03.15.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 15:33:01 -0800 (PST)
Message-ID: <addc9245-cfa1-4137-bb27-99beda42a147@oss.qualcomm.com>
Date: Mon, 3 Mar 2025 15:33:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 4/4] wifi: ath12k: update EMLSR
 capabilities of ML Station
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
References: <20250303221843.1809753-1-quic_ramess@quicinc.com>
 <20250303221843.1809753-5-quic_ramess@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250303221843.1809753-5-quic_ramess@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XRYS9x-L4qTqtZRUT6MJGel_NQDbYyp0
X-Proofpoint-ORIG-GUID: XRYS9x-L4qTqtZRUT6MJGel_NQDbYyp0
X-Authority-Analysis: v=2.4 cv=Sf4NduRu c=1 sm=1 tr=0 ts=67c63c2f cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=X2mNUfvcDLwOzcfUwEIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_11,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503030184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_153306_035973_2380F379 
X-CRM114-Status: UNSURE (   9.07  )
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

On 3/3/2025 2:18 PM, Rameshkumar Sundaram wrote:
> From: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
...
> +	if (u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLSR_SUPP)) {
> +		/* Padding delay */
> +		eml_delay = ieee80211_emlsr_pad_delay_in_us(eml_cap);
> +		ml_params->emlsr_padding_delay_us = cpu_to_le32(eml_delay);
> +		/* Transition delay */
> +		eml_delay = ieee80211_emlsr_trans_delay_in_us(eml_cap);
> +		ml_params->emlsr_trans_delay_us = cpu_to_le32(eml_delay);
> +		/* Transition timeout */
> +		eml_trans_timeout = ieee80211_eml_trans_timeout_in_us(eml_cap);
> +		ml_params->emlsr_trans_timeout_us = cpu_to_le32(eml_trans_timeout);
> +		ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi peer (%pM) emlsr padding delay %u, trans delay %u trans timeout %u",
> +			   arg->peer_mac, ml_params->emlsr_padding_delay_us,
> +			   ml_params->emlsr_trans_delay_us,
> +			   ml_params->emlsr_trans_timeout_us);

it seems wrong to print the values converted to LE if the host is BE.
suggest instead you cache all 3 host values and print those instead.

/jeff

