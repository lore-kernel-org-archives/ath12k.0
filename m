Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E178CDB479
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ViLcShsroT81kRk6zGqQSPcM9M8p8/P9J72RygnYvA=; b=T97EnZOOWpZuQS4FQvCdG2dFl1
	oy1O7pbW4O3Sawn4nVt5SXddHOILRcKQMpzfOvKRcKXCYtJLRwLr86vvGmYiwRpyHXpH1p1M5msVN
	YD5tALwGIqqPPWf+OIZs9lBVSEFoos63d1BuXuZPiF3khSS2VD7q0e/wMmI8okb+UMDPdSx+0eQ+C
	gh4SMRKgx2YajrQf69MIilgcH+a9DiPVH+Luig0cCrtAI8e2knPk04axZvmImrQJyO4g4vvY1nPvM
	3HeCY3nxBpVFgMsyUNMhJt2bkBzzh+CymWDjKSQdTDuR8Tsl967ZxJrVpkqdxkyXdUR9m8RT2a/Jg
	gaFA8MEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcK6s-00000007WnT-1JKy;
	Wed, 24 Jun 2026 09:41:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcK6p-00000007Wn7-1oJX
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 09:41:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u2px2522569
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 09:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ViLcShsroT81kRk6zGqQSPcM9M8p8/P9J72RygnYvA=; b=DoPqQleBrhJPBycp
	/lMT2ereUQ+4zg9B76zLHJ43Ux094daLkakd8SD+9tHpHcMWbnv9s5B5f/GynYI1
	TfbQ+D2W6LM2VQsxvECHYh3/vtvu/xm1RvzOjWP2mX3c+ykM5HtOFtqIsdzdeQ3w
	mORKuqlx3oQuOKvmC/mOLLNtfKixC3kytTyP18KKeptUIHjk5FJ98s2rDVCuzKZr
	STGs8hhjuXmdFjdzxbLLyhKYUI8/wYkGOTo6swezhqnxomqEG5lAUJ3LmaCImPEb
	+0lzfO7VSSw5FD+UFC2oe4F1sgS6ElKIHlBdOYELWjyI0WQ1wYSz1ph592wPSAeQ
	uATzUQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajhmp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 09:41:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8428384f31fso716828b3a.3
        for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782294081; x=1782898881; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ViLcShsroT81kRk6zGqQSPcM9M8p8/P9J72RygnYvA=;
        b=VRhu0FwodY9jYnxEGC0+HOZ41+za1MqSeyvz93FWUAEPsx3t1ah+SP6PoQP4yfR1of
         3EBbXLJ5kQt3xm6Dnk2Y9EJVdN0MmVdr5ZLC51RhRbFwp5DjW0WqnmqvgA7SNsNO14sv
         xl+js+DnChXVvowBG32p0nxykd2anvZ0trlHGlFe1ajq1shnHBhoOYrh/KqPw3Co2k7V
         h66HANieUOfL8CqQyY7Pk/7i6KPthOse0N8Xz0Loku/BcCN/xSug83Iis2bk/LYk0T6k
         5PeIgN0WRUO5AUg9REaKthwTk5zk8wVXdyyyE5O8N376OWcyFgYqbjc/9LJsAR2zUs5K
         j8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294081; x=1782898881;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ViLcShsroT81kRk6zGqQSPcM9M8p8/P9J72RygnYvA=;
        b=LG+HSuLe+RcWutoaNDhO1pWSptubU/dnAbpOuXwwYl6DyQd3Og1JxUcAj8AZitD1lj
         /l1TxJQ0xcBUhoXZd175jXODDNjAEynqo/VNjf6ghYh/614Mc336TxnJyifDn3wGaws9
         KtVWB+YTHHRW765I95pcd2cIeqmYrO3Yj0iLb8ardzfg3FaEn/L5e/nFKZ6mC34nRs6z
         fRulXttdNjv6P0gZBxLzv2kq9adXqPm6jIbBwOavqijogU1GfNNNyw2ALRttbPD+N/tn
         5B/LrFBY91/lATuR1x/X1JsquYgbteJ/dCnAJ7Nm9Yl47qp0KF9L719NSU9XnazeENE4
         wGKw==
X-Forwarded-Encrypted: i=1; AFNElJ//bp7D/EE1wA9Am+02mXu/uOCHy8J2Mzxc7geEBRaZvPX1th1O1W9pPU2S04zKjNJzqfB3mIY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXje1LPeeBuGCKSvdv7gL6kwTcMKzUAkQGekAkfuBv3ByKxK3J
	qVWcrgZ4P7V28Dpawtzit5OP06jSgcOVkidDl/xHfIpcfv/YNSUIAiPdlv/Hg4cDEiRH/OyuzPX
	b6GL+1LExrRszAn4roQrIGMk07H7j8M3/N+1eeuEWWq5G9Nb4RQkrgeSPGd5ss/iq
X-Gm-Gg: AfdE7cn6I59JbBR07mu34dVA72grJSFlbEjaKKx6eUyWFlS5dprUAJfe1xnBeZUrRpE
	K4GxgmUlo3Ku5X3RKEr2X+FKs65wPuGXudJfDwHkKn3aIJKvVlww2oef8BAsPykvUITzT/e8lly
	P/NuLGF3k2Ol/JDagzKnqu7Gku2yLhrM6HZGT2SWxM7As78B9kyt/JTqiRfm0i4dI7KE7vbs25x
	8pSk2hw1ToxidccLbWc+EHxmPPB/GQ+JtI0iEMGeicYFdF0Wmf0hLMWoRAcVdYwk9lk6nPoZnos
	m6jJHTjHo8I91lSQ52D23wiranH4/AwZwgLh8ZyM4OWezc91Cq1kceJYCIg6Y7UaMUZwbFnBvtK
	35dfNWZtwmZUFtj9lO/HqwNbk+ezA5e3Bm7lwWp+bbU0SM85otX3jYqYGsWh4/5IQ2ZP9DDSqW9
	k58BZARwkF
X-Received: by 2002:a05:6a00:3694:b0:845:399d:96a0 with SMTP id d2e1a72fcca58-845a2ca4dafmr3316575b3a.43.1782294081098;
        Wed, 24 Jun 2026 02:41:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:3694:b0:845:399d:96a0 with SMTP id d2e1a72fcca58-845a2ca4dafmr3316544b3a.43.1782294080698;
        Wed, 24 Jun 2026 02:41:20 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d22e8sm1662804b3a.33.2026.06.24.02.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 02:41:20 -0700 (PDT)
Message-ID: <0452aa73-5707-4a8a-8c27-c37b5bf6c282@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:41:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: remove unused QMI definitions
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260623035104.3765404-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623035104.3765404-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MCBTYWx0ZWRfX9GEKPg4fJXQ9
 dZq+tB8K+Povhi8bk3jHitcfHD7Zv7OlM/d+yBqRzEZF7WX20lXeQ9V63BS47eXgwx3tJSS4KCo
 fgWa2QgsiyAdoLtiZ8D2oxyr1vqN8l0=
X-Proofpoint-GUID: bVTDCpir9VivAT0pf3Uew4FZ3udrSGeu
X-Proofpoint-ORIG-GUID: bVTDCpir9VivAT0pf3Uew4FZ3udrSGeu
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3ba642 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UbNLQpdtM3AkULRREDgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MCBTYWx0ZWRfX5KoFj1jZQC+v
 tTa/2ZMz/gafeeFle0edeE1TPvVsSxI9bUrqwKLSqQPUdaKTfxH2WEIV8uq5DIbAr0gzzMfz3sk
 u7FJ55ZH+PpN9ejnK0xmTNzelKdpc331BKurO3XiD0scpkwkc8dq+pDzjEinhHwoxXUIQen3dzA
 yj/PB6QKPQ1E0evt7EFnNMWbPY6AYsYHUpWZszwNQ0ESxnGGX0gFDk+ZndBMH488vqAMSOxOiNe
 O5k4e361BQq26WrcTUVxHOXV5dYp14RcUPUt9GL5fn1AwnqjztgojKBbEyQHPYwD21obg5ImxER
 lRtMZ/n7iTCAYCbDSNS1QYszU/RupDDtR56wz9tQcCmOkg4sU0+sWby4HTrkorWEC6wQr7TKve4
 LJEVcIt0xeqHkg2Lj7Lm7un0tSyd7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_024127_605595_B477583E 
X-CRM114-Status: UNSURE (   7.65  )
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



On 6/23/2026 11:51 AM, Aaradhana Sahu wrote:
> The driver contains several unused QMI definitions such as response
> length macros, message IDs, firmware segment length definitions, and
> CALDB address size definitions.
> 
> Remove these unused definitions as they are not referenced anywhere in
> the driver.
> 
> No functional change intended.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

