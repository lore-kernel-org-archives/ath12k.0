Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F8FD39000
	for <ath12k@archiver.kernel.org>; Wed, 14 Jan 2026 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=; b=kPdOF68y/XMFFBRQqkCeqCIXpb
	3ihEq0Cgo+NM9uyXw6a9DZp6P8wvAcLcdB0OzEczAfAv80L4G675FtmdnBNoqz0s3NPS7mK9e61kk
	qnggpRwu+a4vDL0Wox3PiNx8kM9GMYUZNwcpBjXZjsW0ilRcT+L8tuz3zK2NAh/51FpsOTDdFS076
	inG5/byuoq2lDWN9EMYgwDvcQ5IvzjUEXnL+q1oxKBIH8nVYoVEuyhl8BKaIqFi2rEe3P4gTiAE7J
	YB954LKwDmsKDNf3M2GAOEsDUHtJNUDzWxT02e4vnDw1aXSdKKU88VjtHNOTDdmWjs5uwAXQPU2a0
	vgT44AfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg51P-0000000ADF8-34bn;
	Wed, 14 Jan 2026 17:51:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg51M-0000000ADDD-3WOr
	for ath12k@lists.infradead.org;
	Wed, 14 Jan 2026 17:51:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EEUL7u2082100
	for <ath12k@lists.infradead.org>; Wed, 14 Jan 2026 17:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=; b=gmgL+lK3KszhCY5E
	qFNPzBhDI+duHbKtpNnxGSIl1bYFgVgSsGEuMacg/B8a8kYn1En/t9o2jegQsCkZ
	OkQ5GLj762nSpe1NJsVcwQi+ZlsGZLb5W8rZm2Rjzxij7p/8yumhlp7ruq6+8Hms
	uHbvC72tfSAzcIpOZlnnSn8ckNJIP2y6qtVG5TxnynrpaEAqZB0h3vO0DXvOxbkg
	uBbTWYulu0YuPeSwFaFfKCIE9p7YFI1wK2TT7LQZDKPoWIQ98HAwZu3rB2a7cBIb
	IvQrBsK8ZFmV53wpfC12TJ2U6ScR959nqLjOP0F243Ua4EZ/7kxUoxoBBgcjuLtg
	cCPzeg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58vhp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Jan 2026 17:51:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ac39bd5501so101945eec.0
        for <ath12k@lists.infradead.org>; Wed, 14 Jan 2026 09:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768413063; x=1769017863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=;
        b=SM0l2ZGad2I2vwunszKdGabHGs7qq2uO/UH+mSEDLIx6He9L5YKsrfk6M+XnE5EHOH
         xBxcJ7v9ttYLJAWOz+iYd3pwEmbj/gfld2S7OvtydzuiiRmZ27yH+MZhEZE2s1kMZpit
         YM2rPt1OhgF0RvAOKGLdQwOoUreVfN7S58t2rE/5vV7aGR2yPK8y7jjBFgfKmRzZo9PH
         7+GHGtYvAd/Obo6OjYwX9/wPS8QsupJvMqNi8bh+RPUjIf5jeH/cJkl3DtG/+JK07Lmr
         9LH1g1KpikqHgKYdgKPlxzVZMCDhYaMTMvZeADilRiOm5cRFoAtZ6AfQqTMTmpVrWCzh
         Xefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768413063; x=1769017863;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=;
        b=iT6y3r8tWNJ0uP82MNhmTUKy+YyNbMe4Fm/gDUiJAN9TPo6lFlK6shZ7e052rHb8uW
         y+0TESSr+Z8+zG6GBH/UBBqBbWwcWMfLq6LpAKe4NqOTiHCta47i6OMIH1/XSnlxNqv+
         h6NMgGtTb/GmosbtFgXXrDIdkS1Tug6+DddrqHx2P4ctFOsEgQ7M8oWUuQqlNpDVygNS
         u0Wmcao7lmyxUu6Gi+pALzLeAPLYQFfZDFldYJ3bgJKO+HNZQWHa8X+e+xruPmNv//e3
         mIJiYroLppVSdi1L6NXfgKpY6ScdSR0bRvwsgPslrgxcC1UdrBAlvaYBVDkLrZwitVpM
         Q3uA==
X-Forwarded-Encrypted: i=1; AJvYcCUcEzJ990Ev6KUgqmPIMWv4V0gS5jMeUaXNHbIQqCns/lXno5PZhF1aVehQfVc8JTx4z2abxoA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIdaYemBtMr4x8BFFwfov/RdGXUvHDScrcsVWxiDKClrroelQD
	TJ1X8DUPpQZKGuv668mNwovpPGYG/aM4dXIns7RuUnXeDxJ2jylUMTq+KeppYnQnZxA9LR0Fpcq
	KXAuGVjO77rmaJnGexdrfgsXj9RU2gx2eQCNbw4/0UhxKSSE8pLdq2GqjYC7NOo41PrifKeeq
X-Gm-Gg: AY/fxX6SUdQBZGjVaPdfluLXvpaNw1eLTJM+yBkL3bngEW21GAI/n16QXjAljrHKzqG
	Cndq6bvvW2L2dRG46OAPgADo9TqB6Hhc8NEoLQoak38CrTw23S6VSZa8j/Jl+KbcH54hMNMR4t3
	yxA3nY28Sq3JAqvxfXpGYCVvsa4YOXtiabV0ul3js0P1ND6iqQWNxSD8Uxd1wtIFADSCmI4DQsU
	BDVXkfEeXfWjB92Yclr95U9TmA/9CdG82QoWzFFpyCKonNzRMGb52uR520/7+UUO2FmLksoCWSK
	bQxwo0/y38I3FoVCNXTl0r6WqWmHjY6xMN4n7ydhK4Ncn5YyMAriukhdkQFino662/BPsEBE38I
	hAd/s2Fi7Dbj/AbgYu0WL/rDeoVoqyYWObyabOHNQ0hz3C6Xc1kBPrIlElExfzci+Pr63fA==
X-Received: by 2002:a05:7300:5388:b0:2b0:5306:1773 with SMTP id 5a478bee46e88-2b486b72cfamr4211573eec.1.1768413063443;
        Wed, 14 Jan 2026 09:51:03 -0800 (PST)
X-Received: by 2002:a05:7300:5388:b0:2b0:5306:1773 with SMTP id 5a478bee46e88-2b486b72cfamr4211533eec.1.1768413062713;
        Wed, 14 Jan 2026 09:51:02 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673b2esm20529879eec.6.2026.01.14.09.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 09:51:02 -0800 (PST)
Message-ID: <e78d25d8-8741-4061-ac9c-606f3654b98f@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 09:51:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260113
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <98386125-c0bb-495e-b2ba-2765aaed19d8@oss.qualcomm.com>
 <33d998cc225a7aeef4731ebc53c28a32b241ca7e.camel@sipsolutions.net>
 <f12c186c-c76a-4d39-8591-4c8d7d04d307@oss.qualcomm.com>
 <22746c254c4c43561e2e3deaf49dadf7c57dae17.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <22746c254c4c43561e2e3deaf49dadf7c57dae17.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE0OCBTYWx0ZWRfX1BEr30naBJUs
 6epsfqUU1jx5FDZD1K+Py0YKNE1k1MJM6Yg38MqA5SDaXFjTDzg4wd3HS6yCd2Lc1+nt5Kauets
 1/pPXd7kYDSGxwNYsTs36NiyiOOIockx5TjTlJ1HyVr9/NqYQgtgqas2OsoiZaO+v1Nd6Tk4qmB
 8FOgqDi7Jr2sp2qk0Cb61ul5c17BZdoWLy52HddC1e9hOAt0shV0BZCYe3GsttpdeTqeROMRUlx
 T6xtw+cjwMKFH+yKVaarDB6zE8XAQdREiHLO6+PZzfXXF0SPbfbNPZNmtEStVhLxT5F67z+6DDI
 LG9lzTLh2dbfZPkI132d4ytvRnppUdJsu67JSd0wfurtugaCRaZ8hWNKArrhpHEBMdf99EAWuEo
 +U8s5FG7Slowx8rq8qnAQrrI3QCRy2jFyAKh/uZwt3jOXoB94n2Fm2HVhPjVe6KhqBU5LcfHGYl
 4OJQtwOzDpoGxJ5D/SQ==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6967d788 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iu6Z6aglds9mpAdrEcIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: yTtDuEsZuZo7t6oFCglC4rrONwSwI14q
X-Proofpoint-GUID: yTtDuEsZuZo7t6oFCglC4rrONwSwI14q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_095104_872700_43363C6B 
X-CRM114-Status: UNSURE (   6.02  )
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

On 1/14/2026 9:08 AM, Johannes Berg wrote:
> Do you just want to redo it? I don't mind backing it out, nobody pulled
> my tree yet I'd think?

My opinion is to leave it as is.
let's not add extra work unless netdev or Linus says otherwise :)

/jeff

