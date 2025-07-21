Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A937C83F25
	for <ath12k@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUUJkTS2dNGZNjwVuHCijvlfJkFa1kJrAWi3EgXXWeY=; b=kL706XMjJS4atIriMLT7BcRJGp
	Ta3xqRL3IFScsfz/d/yGd+kO41DlxcmCDte0XymHteUzC5ZxC7rijxJzBprqmKhSiCTKX9DqP6dCm
	CWmxE3bruiMnP64xOShwJRJvi4DBmPXt2CbA/5556wO4IsOtmS2tQE48KNkW0WObnjGZPUy1oEwsx
	uVM485DkPHbxz0ZK+tMJ9Qp2hmjCMfuZ7cV5HIb5eLyZe/WxkaftCrf7upVKQGgWprgHyD2I15d3p
	r07pNy6ROasZUV7D8oib40WCQoGMWx43cUV8/8g3aXaPPq6jkdLxU0k5WOf83Qo/n9yPNPqZQIlHd
	k7VMuizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtb2-00000000Br9-0dhl;
	Mon, 21 Jul 2025 16:42:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrCh-0000000HT1W-1zV2
	for ath12k@lists.infradead.org;
	Mon, 21 Jul 2025 14:09:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LA6klQ029281
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 14:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUUJkTS2dNGZNjwVuHCijvlfJkFa1kJrAWi3EgXXWeY=; b=iPkeFIcJRZqUTBja
	wGSVKVyz0BBadlhrqw573sthq5YjZEGlRs2WI4WL7KDvZ+GkPV8SVAnjuo2H2Mad
	eSUD0PxpFcrlj1VCjs9Wef7dIq22q6ndQm4kNta+qsQ8QBZncehGJLSqUIxemLvW
	OH3oE6G0/fiy0xX7ZAoC6SCaxW8quOF1LW82pqUBD00YwJbh5qHIWYjdEWDQapg8
	V5dOq7UAGgK6vFM4HP3yCLMdlZIN6hSqIl0ML2nRNF4XWzzKtQzMBnYgCv/RGuTU
	sLMlUdEZIf6DNf7ijEVQzyB8gw0g0gKHFCTOZyX9X6zLcN28kmvVkq0ZosH3ciRb
	jfzrQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048tde6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 14:09:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2356ce66d7cso69815275ad.1
        for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 07:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753106956; x=1753711756;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUUJkTS2dNGZNjwVuHCijvlfJkFa1kJrAWi3EgXXWeY=;
        b=t91UTC9IN8IgWZRabLfZw3jkDm05V0LTea0A28g6qk64VLJNbSqQhQoboxOUgKtLDm
         1AmqihZOzIQDf4ZAJi73uutVDCyQRQUwcBjTY3XUz8l/B/7uI/xGpg51UDcBIsFXFUjy
         3CXEKez0Om9uwCNtr4PObt17iFdFii6tlhCNpz3AqNQsxlNGEqVye983xlpqmhQtCJfW
         7L/Z+9nnDD1JnCzManCLpB+3YvrmXYey9nz7WrzXh5RSQVA+bDtdiRptTxh/WeCuEfd4
         s5RrZD2E8vJyU1ak/03E8CydbWIMbBfCqhV6Xli6USskvzuHGFyJyW0g+Qw8r2vQnzUw
         fZtw==
X-Forwarded-Encrypted: i=1; AJvYcCXyW/yUkRVwSHH2CEz3bt4rRsSN511xqw+ufKDbc47lyhErXYDRdE7kznytCWTkt0f+xhGJB2Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjbTK7/HILgDz6CBXs9Yhf04rb429z262w/M4FV5G457W5cqNN
	cK3ji1yERrdsd7goRMe5KiCUUyRjvH9H0ahe0nQVV7UH57d+f3sjxqtn4q1P1t8P7jjONhjJ+PK
	3FZZ0rK2RTzd+qQHBaqQ0JVa+qeXozQmhe59lu1nvwPdEX7E8WpgZgLzk+DJ4msgt
X-Gm-Gg: ASbGncsYNHJ9+wLRRxD1Cu6eJJ57z/NnSxnROG/GQwPiDl2GG2EzqApg11E0tFfKAIk
	VH7hPO0fpdNLm+DlT5j7H1Ge894AhHjnzZW5kWelsxr+xVgBO6R+Tm2U3IHw0xjJNzfUHPTzAVh
	3fLcIfpeMgYtuoUkXRX+qIguLg84yuRVyPkunnWkl5qHnn+/7BrmNVyYIdfJyisHTSOg1niXXGG
	31bHHFje+rbKcaPMLQoKKEwHOhG7rzQBevZk4QYi7Bjk6kmOY+dyWZfbc8c6aNyOojZMEKleu0U
	K5rhHhnJVRgtzoeSKw3MiMvV0y/ykluOivfjto8/IJ9jILu+qg4l3ahNCZMNvC2p1M0a6eInp3u
	EnOu7wc9/nhj78OBXBdI=
X-Received: by 2002:a17:902:dacb:b0:235:1b91:9079 with SMTP id d9443c01a7336-23e2573640cmr293096715ad.32.1753106955955;
        Mon, 21 Jul 2025 07:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXoJfjcOR+b9DjNkXyq7GaF/ukea4c637suUWWiYFvb766O7yt7nD4LCF1PM+DX339rv3TIg==
X-Received: by 2002:a17:902:dacb:b0:235:1b91:9079 with SMTP id d9443c01a7336-23e2573640cmr293096235ad.32.1753106955580;
        Mon, 21 Jul 2025 07:09:15 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e9efbsm59096375ad.5.2025.07.21.07.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 07:09:15 -0700 (PDT)
Message-ID: <da13cb46-8680-46ac-8bc2-3513be43a492@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 07:09:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: bring DFS support back for WCN7850
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Mihai Moldovan <ionic@ionic.de>
References: <20250721-ath12k-dfs-v1-1-065c31454f91@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250721-ath12k-dfs-v1-1-065c31454f91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEyNiBTYWx0ZWRfX7kxwLzwmqg2U
 82wi+t/KJPuEzKaTQJ32bqnJVd1/ihQlhENP7ZLDkiQ2NiFuMx5iFW7NTfx3sV5DHeOvEkqKKcb
 rvTFyDeT9cVtsqusSnVHfgRyw/yXSckY0/JfydgGCSRHJAFe7hSKzYJRSF8ngPgpwms1mcG35gv
 UAjTMvQelxxMYO6f8PL5sQeTvt5LrU+IMYKe4uGk4E7abQHxCAAd/3TP7POZHTVZ68iyMuNaWX7
 syI9yHFJVfYil/6WAGZireddLSOYbQLlb0Gr2OIJkDEkOEFNdxf8jV6fRjb2+NtdGPDTV7LMp/+
 WbgplFFt1gkE6g2GAkVuXpcCTBLEkw1j9O84Fu6JjHHGi4RaVCZksoAeK+Lp0TKfa5GxVNM3oHd
 DjHo+l+K3ezEw76RuatcVgzOuAscTQ15IQIZloTYpJeF63xqGpEAbgO7qmdFtRVcmchlENRD
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687e4a0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Mae7F14F_SpBrmaiimsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: NL7u07fE3ncD6e86sG5Eg6CtR22BZAkq
X-Proofpoint-ORIG-GUID: NL7u07fE3ncD6e86sG5Eg6CtR22BZAkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_070919_631795_D9172627 
X-CRM114-Status: GOOD (  14.08  )
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

On 7/20/2025 7:27 PM, Baochen Qiang wrote:
> Due to the restrict in MAC80211 that DFS (Dynamic Frequency Selection)
> can't be enabled on multiple channels, commit 176f3009ae59 ("wifi: ath12k:
> support 2 channels for single pdev device") removes DFS support in order
> to support 2 channels concurrently, making AP mode not working on DFS
> channels [1].
> 
> Revert portions of that commit to bring DFS back, and add a new
> combination to support 2-channels concurrency. This is valid because the
> MAC80211 restrict works on each individual combination, but does not care
> about them as a whole, as far as DFS is concerned.
> 
> This change applies to WCN7850 only, other chips are not affected.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 176f3009ae59 ("wifi: ath12k: support 2 channels for single pdev device")
> Reported-by: Mihai Moldovan <ionic@ionic.de>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220346 # 1
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---

I'll update this to capture the following from Bugzilla:

--- Comment #3 from Mihai Moldovan (ionic@ionic.de) ---
Yeah, adding a second combination with DFS support seems to work fine.


Tested-by: Mihai Moldovan <ionic@ionic.de>

(WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3)


