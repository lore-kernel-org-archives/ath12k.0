Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD5BC021B8
	for <ath12k@archiver.kernel.org>; Tue,  4 Mar 2025 19:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMPBH9whDhhZocTSmFENpQEm0m51WHNrqlz0wufLvUE=; b=OcgVdlMamtU4Z9HH6stE+hSJ4/
	izS/Ms1FNcCl3XZ38JrHxjSmS17Cna2kvVcC1rjzA1xWrcODcXCDIY1+RrlGG8waGK9NjGYLViyJA
	4Fih0sSD1Eks2zk9dn5RpdjHY9A2BDGpNsAXkT15avGOoDO6FnLBeG3TmwYFufs9JzhX+dYYXXVtK
	/VOxwDw4irrQKhMDKUkynQbCVLAxPqkK4QlGZnV8JQKQb4uJha3TC4FndL8qFejm8iIogRvufoD4g
	Qg/aDKzNmclRArsrlZqfVyvHr+7//TISY8Rt2BNLW1cvDyvwVt8VO7yAo2Wc5LhOtfjDdmc0R4PYK
	ODwewOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXe1-00000005xvW-3q7x
	for ath12k@archiver.kernel.org;
	Tue, 04 Mar 2025 19:09:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWCU-00000005fCy-09ST
	for ath12k@lists.infradead.org;
	Tue, 04 Mar 2025 17:37:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524A08Hh015969
	for <ath12k@lists.infradead.org>; Tue, 4 Mar 2025 17:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fMPBH9whDhhZocTSmFENpQEm0m51WHNrqlz0wufLvUE=; b=GxrQBiOv/FKDd2/5
	ySbn+6eSCD7PzUQESQZ97PcZDA3PL7TMc7bhd4Dj5dGkoF72DtFhYGihyzCKDimh
	QJBdDRpi7NUNK1/H1R+5b0slszNDqkRvvN1W/78bBi8WIlN2AgSmXFSp+vyG7U+Q
	AkU4Iq/WBzY2KFOqU0k4arnxP2bvBrW0pYxAGDs7XGvUb/oo3Hmws8rTffflJLyD
	i3upzxz/feGqxCikDLG8a1GJdXt332LORAJ1ElG7XDIhnWLMNh9uUnEna9p9UnPW
	WkiObYu6/564NDdE7BrueVxGhMi+6ZLTQ70Q4lVe4qzIE6S5H1KY3VWh9iSBZJH9
	wujz/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tjpr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Mar 2025 17:37:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22328fb6cbfso105043005ad.2
        for <ath12k@lists.infradead.org>; Tue, 04 Mar 2025 09:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741109820; x=1741714620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMPBH9whDhhZocTSmFENpQEm0m51WHNrqlz0wufLvUE=;
        b=p6yiv4gprN4mZ6setYCHzkuGLgChHr1V8GSyEjYjcGRuIcGfzAyKkO6Ms0kAN5jwo5
         Zx5ufCZmTFXabqY0TOnlS6BpIHZ8293cwBO2DTK2LiO7FCU7sT/2RW7DujuVjryourKn
         tRnrJfd5fgEN71AwjiM/18UmjkmBDgT8AHmXLTt8ai/ZPz8pX3hZivi/RAhaaftlJqAd
         AiIL5CW8dP0NjDUEYT7oJi9OD2bbIdi57O6mAkHWcmyVf/o0NibQN2PRqDaQ1d1/YZqr
         mY9mOYU0/knMyw0IqIZY4oWjF1aso9ILhwqWwoQ4tGcSlLWaH0P/Qrwkyfig4503YYd+
         nDPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhDincL3BmGHcPYo9rdiisPY/1mGBSoe5yFKUJS8WoXv7oebQphQTFVW7SlPXv2J8yWtBdmtc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjwik/6eUslCQalwqzDpK7FmXthrr4g4SJmF76B3fQ8OIN7wor
	nP7seyfysXVOx0CKZyNF7lSAoK8pGogqlLv3toTHSqvMGQtCJONG6Py9ZuaMhM+eht+HYwUeXv9
	iwlarfNxz0b3ilfaDOyKCiB55Nn9+XCRsSJKQ1qkyEX6yTuqJCbMGjdJh7VyrRH7ryYyn
X-Gm-Gg: ASbGncvsWuk0gkRn2vogLuqy2aJ/izQ7nm1fAnVuSDpKMZzArWkE0DA9ryUcpBsaVf0
	nk/2+P4LMr/+F92o6r70IBV53SW7zjfmYbrMUWW2uSAN1Jwud3KxSiLk3ndl2qyZWl9i1lpDRte
	zs/hyi4oHas1868jEi4UbFTm/TVl6dBJJCt1fS1IHtC+FYDbCz7z8whPSHbVYIblx2e1lR/UHLe
	gx5udl/yLJKShtZpw9W2mFMFl9Eg8QPurieWEo8Jx7k5fk4CZLhIFKT01TvpnH+ZHqzkreBS21h
	VvItrOLq0YUyPjUNDVUZZTRVJW2cR/H+1RY9jX75csHewbZqNX/Cf93xvQrDx/lOmt9NaEs=
X-Received: by 2002:a17:902:e751:b0:223:3624:87b7 with SMTP id d9443c01a7336-223f1c81c29mr463735ad.13.1741109820411;
        Tue, 04 Mar 2025 09:37:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDBzzNTgbhvaxB9lV356jrNGXZCtBSJY023NHNi55qmToPCa1RTuAfY6yPx7E78FmKbUKwyA==
X-Received: by 2002:a17:902:e751:b0:223:3624:87b7 with SMTP id d9443c01a7336-223f1c81c29mr463505ad.13.1741109820036;
        Tue, 04 Mar 2025 09:37:00 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501faa33sm97898575ad.66.2025.03.04.09.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 09:36:59 -0800 (PST)
Message-ID: <6eed9dae-7f4d-4757-9d49-b21aff8e802d@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 09:36:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] wifi: ath12k: fix NULL access in assign channel
 context handler
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250222151926.379652-1-quic_periyasa@quicinc.com>
 <20250222151926.379652-8-quic_periyasa@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20250222151926.379652-8-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c73a3d cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=FWO0W7fNcufi70nTIj8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PhbNqdzjYG_K_DNRmazgC2T_FgAsuQKl
X-Proofpoint-GUID: PhbNqdzjYG_K_DNRmazgC2T_FgAsuQKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_093702_083272_04651728 
X-CRM114-Status: UNSURE (   9.05  )
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

On 2/22/2025 7:19 AM, Karthikeyan Periyasamy wrote:
> Currently, when ath12k_mac_assign_vif_to_vdev() fails, the radio handle
> (ar) gets accessed fom the link VIF handle (arvif) for debug logging, This

WARNING:TYPO_SPELLING: 'fom' may be misspelled - perhaps 'from'?

> is incorrect. In the fail scenario, radio handle is NULL. Fix the NULL
> access, avoid radio handle access by moving to the hardware debug logging
> helper function (ath12k_hw_warn).

