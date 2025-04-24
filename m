Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18270C369AB
	for <ath12k@archiver.kernel.org>; Thu, 24 Apr 2025 22:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr6UAcTBHtz3bYIJUxJHWQ9CaAr472WSv/vlCBSVX0g=; b=zdfbGp6gmQLzAh3zmE6k2vHZdI
	m8+H7CcbnOVl71OjhaJjSz0c+psYmtJgcEaJDkCbTYzOyKd/lMYtqZxeb8FyTpqhKWsBULtn537xa
	jHPRrVm2un0F+VwHTP9jyFBnESjvHX2dVp8KxRuGtVDhlBFON8q/sJX6kmYLopPLmSykgOQm5UgAZ
	xihnkH4maIgdfmlKSbWYZKcpBsVSZ9LzROf9r4rntRiEL+YIt6CZFazRwRJM+E1DH74VKVWdkVgqi
	9bOPPBA6d2hKJ1d4y2iKtqNhvpxjrrYNOc5TEFt2Qt2UW9tNUv0XqXqALg+nI5FuBqHcqCgedEPwZ
	K3/fc2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u84rI-0000000FTVv-3aQC;
	Thu, 24 Apr 2025 22:15:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u84rH-0000000FTVW-1eTr
	for ath12k@lists.infradead.org;
	Thu, 24 Apr 2025 22:15:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmgdf010837
	for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 22:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vr6UAcTBHtz3bYIJUxJHWQ9CaAr472WSv/vlCBSVX0g=; b=Gg/7EizpTV7RjbaY
	cY5PookUELZPHqUGvOtrVlSm75UWRDnmMbh/RfPOlQNdtiYgXLil9WVeu5bFqTo2
	knYuZ2e+FGO5UGE8SbTx9nTmvg3YcNp5Ex3D3F3fcwVL4uACsQiAK8A8oDSDj/Vn
	t0YznN6AMRWA3LlhSeOuHgxeBFogI9LrbRw5YSD6U6y6I9bzoFU2IhSly0OTGI+H
	8w2bvLbNzVydS2ShGPMZuK6wDEbcJ30TzUeXtVzMukE8LazVr5s+WsODdanJIDWM
	uUMpEp5OZGMdrCVIo3RGKu/HHm57XJhjG/7NtFQBWZvX8gbvjVNdR/JbVM4xzvgO
	ykyxIQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh274k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 22:15:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736c7d0d35aso1963931b3a.1
        for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 15:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745532950; x=1746137750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vr6UAcTBHtz3bYIJUxJHWQ9CaAr472WSv/vlCBSVX0g=;
        b=LnamzwbyQd1SVEnagf6obXjk4mzGBm7Z94oAjg5NS51XPGWMqcb4Weg49YS/9P+y6k
         BDvveWd+bZRDYyA0Y8Q8YITaOClRfHtK/3BGR7J8wqt8hi2P7Z4v5GxH821DjqOznoj9
         Zn+sWmWV5qhDv38Jw6EsjlVP62Wd/h2z33mdr6N2uCxAjwoSxZXAHpjm+3guB1CtIpot
         oyFFaZ3+oVIOmeLtGcnsm3GdimkFu2B27dHw9pPrhSFT8HHoaF/5M/IGnI6HjNdDyy3f
         aWYdNqQ2xfSEAg61FyKz0FecnJdC9avYbbHJsxeFW1VY/tXW9O2YCMLzRIt2+CBHsGqk
         Qgag==
X-Forwarded-Encrypted: i=1; AJvYcCVOx5HWE4s/cgUQN20gfy3qXnblnovm6HMcZPM1sqmTmiNYA0/BNmBmP7jM5VMkq/1UIilxtqY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhvxDLTNzX9LRdArS2V9SwgnKtlatEp7JLDhruNhvghvNR2DJ0
	Pq6pG1ZzOxZPJDDXsurBKoI0YzBPA/NHdsBI4Rou3xy/Eje2Vvj5/nGMe8MRTJ//lu/1gk1mHFc
	tNeOuEmyfH95EUTmIlPD179DZVTKoGxe1DXJ+UQEjzjKMN9Y8L6BBYgVxBk9s
X-Gm-Gg: ASbGncsEDH5TlqlIU5dpnGsuO4HCTWz3xES34U6eAAw2e9HUi+rOoLRVBq3chakzads
	eel4jC2FXyAeeu8PbTmitr1e/69m6NyhtgtsUHf+suaAx8uiJ4fQb0Q8Wwe9cvdW2TfadZkfbam
	05cpaKl58cw02fyuNDS+bnybqYEUuZrs6Uv9S45FuUsiVh7iRQ9M3xMGskDshIb88F4V5dLKUtR
	N1JY2px1SYg+5xwhiGp2WHPmkQiZnvPVV+sLExLXW1NoD6MRixNU/wkI0fyZSUmAD82Ofq+CV6s
	wDiWwM1S0NsdpNtfmtkR4wZHC8DGzHtCQXqo7ZRSRVybhjJyKalRLZC8p/NUY8fC
X-Received: by 2002:a05:6a00:32cf:b0:73c:a55c:6cdf with SMTP id d2e1a72fcca58-73e244baf7emr5617614b3a.1.1745532949795;
        Thu, 24 Apr 2025 15:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQw6Y4u7NIb4vjYTCtAAk8q84Jj+Eq2zrXWlj+UW8hdGkdREhKcn2OY/pw8j/33iRxafWYUA==
X-Received: by 2002:a05:6a00:32cf:b0:73c:a55c:6cdf with SMTP id d2e1a72fcca58-73e244baf7emr5617589b3a.1.1745532949367;
        Thu, 24 Apr 2025 15:15:49 -0700 (PDT)
Received: from [10.227.106.66] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25962f61sm1934011b3a.74.2025.04.24.15.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 15:15:48 -0700 (PDT)
Message-ID: <30457c04-460e-4bde-8e9b-99cfd9d8f570@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 15:15:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Prevent multicast duplication for
 dynamic VLAN
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250310230105.3534334-1-muna.sinada@oss.qualcomm.com>
 <d2e6a1e9-7831-4342-9458-4628f9cf7182@oss.qualcomm.com>
Content-Language: en-GB
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
In-Reply-To: <d2e6a1e9-7831-4342-9458-4628f9cf7182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680ab816 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=McVu47brbZajC1vxsbUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: BXlRqO1eTQtHoB5cXagCiGJCnhQIxL8W
X-Proofpoint-ORIG-GUID: BXlRqO1eTQtHoB5cXagCiGJCnhQIxL8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE1NyBTYWx0ZWRfX7/Icj9oG1UOC bGx0lIjZmYGo7nYbPOgWljLMUOzENUeTKVmHGwwfcqPWKiBty1n5tKtXzIzJXPvRA9QGlcCl+3U pQk+vhSsrpkklZItHy4Z2naskO8evaIWXBvgcoU/Lg5ghpfP3LNOR5G0UKpGl+9c+pPj0/6Qae5
 yt6o7MkrPD50g80sDE2q2QMbIz/LyYhLvObPf87Ogt4OyGkSxwVSkPFFPj86L5pcynjp7kQUsAQ /Hwm2tM9fOTUEeHOttVDNvNV2gPtHAurrQ4c2372DHVs5lVNGObX1Be4Jj6CWKCerg/xpaqkCrp KgxUCPpaOs00T7NAAnwUWnjxOydKkQ0O5v3BM1dajldc2iq1b09GdOtTysD1vFD6LC8CoXp207Y
 k9AJQmVwX00xwAXlhIAB8EBf/evCaTQ9lxPVnn3V6cwPZdkn17p8QeaJmfslhXWAXrlXTSks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=552
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_151551_443844_A64F4DB9 
X-CRM114-Status: GOOD (  11.87  )
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

On 4/24/2025 7:08 AM, Jeff Johnson wrote:
> On 3/10/2025 4:01 PM, Muna Sinada wrote:
>>
>> Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
> 
> Don't spin a new version just to address those comments.
> 
> I can make them when I put the patch in the 'pending' branch if there are no
> further review comments.
> 
> /jeff
> 
I went ahead and sent a new version since the patch needed to be rebased.

Muna

