Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16713CA601E
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 13:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvzXKJBfV+uayQ0cPiJ9wsBuI0kq999R98zNptLnsRU=; b=v1yDLden1IXUmVbdK75ghT2Npj
	Ofy6LABZQbSJ/8tqehmBtSL7+U6FAkcnDiOFhvsJK24FUmaHNf+ZcOyhbf0Jpz1jURuHB3BKxCs/h
	rrdcveKybF3I3Fn14uzpbu7+2XcltyPbPOxAf5GHLiSyMww1dI+Ve6iEX2ucyZRKTL/2OCd+f3zK2
	DtQYIDy4TfH02Y8E3o0Xs465yFdVWX6qyVsiJo/NBuSykd98f/QDyrYlw99P3f15+0sW4RpvoemhQ
	4oULDMZRV+rwVEcj7muWtAvUwWwspe5PgQkSzz112TYtLFEu2bE1n10qSRJW8YjkyeQSjoVdMAoQF
	Bypske7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFB1H-00000006Pmi-3HAO;
	Fri, 09 Oct 2026 13:52:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFB1F-00000006Pls-1Xyh
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 13:52:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DkubY2362562
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 13:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UvzXKJBfV+uayQ0cPiJ9wsBuI0kq999R98zNptLnsRU=; b=gXGxwzV7cSXK5WbM
	xe+y1GTYtZq4NdCKz6x4hCULf0W6Yv8slbNSaf+e4QXoW2/naryQ9eaY2Zl5ZqfQ
	B7TRypAS/SJGiqYoOKhCnXagIxvvnVqXBQzpoz1x4W0tGGC4xe9PIUd551IzmFVc
	fMFnNIeeu4nn01cw7K+TGjjqoDzR39KIAnNpH0cRAIPASv638GmUcuavVGHfHMbL
	Z8VoXndErs8BQ72uG8cWXNzF6ysU49hrqQ/b8Dshl4l3xvF74fxpqxN5odcA6F+V
	rEAgYrklltA1zyKeaOHmV8qILndMjNBlrX65oFhniO/6Y7K3CJ6KL/M57xhdh1fV
	o3NnaA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f2g19p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 13:52:16 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c7f887ac6bso6598480b6e.3
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553936; x=1792158736; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvzXKJBfV+uayQ0cPiJ9wsBuI0kq999R98zNptLnsRU=;
        b=krPy4e52q5XfV9Eb2g9iR/GbYMETwhjqMyuRU9Z9324XudmM7Ct2MAxk3Bu0EcdAiF
         RTQwbt1aS0uEt+oSJVUsX3gcsHM+NOK8W9uozp7gf48N9WI8rmeS6QUeLm7hzPMPinTw
         vIaBoEiyq8J62p+6CCZGTV0yb889PCKoHJMP/2d6/5oxcWHAFImZY0oHtiXy1oZqm7IV
         lAyB8gyWc9QqY6zUTg8C4tUNa2QGSXgeju8bWkmkpeWSrBzSLCenMk9KC0k9giwrfnSQ
         WWzbJkwhAh7luZBfqfdvYvHuAGFi7+TciEiFa7rByvc2t9V+G5IQPTUHI8FD9PeojCcK
         l/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553936; x=1792158736;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvzXKJBfV+uayQ0cPiJ9wsBuI0kq999R98zNptLnsRU=;
        b=MUdw6aCSD0HmgMKwodcuiT06D3ZTQwcF5TiYQdBSPJNvFkeBok9BzGaoC/K1jR65/p
         YR1kSFQce1qXAxWBZF7cd/JYVJ0hfjs2VSV/kHPpHoQ/zuhUiweA78ZEn8mF4850/0Tb
         2P2t4LYQL34aLs5RFsBbWnEAJv56QATrqXcdAZ+PPMXar4TTH48vyHfyLQIybi8gS4Q2
         St24d5RQI81dwq7ZbiVcElaeyJ4aofoUqbE7Z3WUCxMHEitqgsPU57zn/TSUlCBVV4+2
         0EAuo3/oWKoNMs8n9bl7z/0GO882CB7Vy1YDqqi3xlrP7ZpdTkPVe77Y81ngXHldyWso
         2xtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwwAUs6K2D2A8UK/w80YE1umPf91BHSzIbNaOY4pO+7xVkAV3cXjXijrxQJ1N7WwmNPNqGdy4=@lists.infradead.org
X-Gm-Message-State: AFuF++lDxUqGg2cbcRtaUJPmTUuD9NtOqpIwR/OCeX5HpNkvEPJnEUtC
	MyWZcsmIJmywKmfV3p4JOgkuZ3syd120TPuLpcdlylb9ab0XePGd08F2slFa7rghmolQ5MStXqq
	Zq8RGaMqqftePHoz6/8nsgoUivmEl1hJO/O31vQqsPyaJ1d+euv/iE6e/Ru7pia8L
X-Gm-Gg: AYBFou0txLlmUhH5ylme03i70vgVdr+x5J32BTyw19IJWpiA7Pxpy+OEgQuGr9WeKNV
	pGTwK2UC8eQjIheBjOc3rQjlCbx2FS+lcctaTrt+fC7LGNjEIT3J1JfiejHgRYrwvvMt/DMqk3s
	vqDeBPra6cSLafME3ltYqqNvqkfUMznk7JUWVIVpQMwajk2uTotCkn7amYZI6a/WhrfzGhpYfX+
	8LtCDxekHmD4oG4HTXn0qtdeWrsd2VovWPg38xgRU+s66mlEEZE1PsuzAaY0hIxc3pgaMiS9xgT
	B1PRzGhQ2UWAbak4GKMsA4bNjJeILcGH5FbzMEmPNSGu03ud4TW9JYmpk/tBPTUcqfwDiY2/OGz
	4kLM8cQH47DQpsXhw02GeoQDfMv80/lN7tFlUl7N3Ws2f2sa9Oc/oZ1E=
X-Received: by 2002:a05:6808:6eca:b0:4f3:2f34:fc51 with SMTP id 5614622812f47-50c438a3ea0mr1454070b6e.8.1791553935632;
        Fri, 09 Oct 2026 06:52:15 -0700 (PDT)
X-Received: by 2002:a05:6808:6eca:b0:4f3:2f34:fc51 with SMTP id 5614622812f47-50c438a3ea0mr1454049b6e.8.1791553935058;
        Fri, 09 Oct 2026 06:52:15 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c16755587sm1949024b6e.5.2026.10.09.06.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:52:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20261003101944.596546-1-yaojiale02@163.com>
References: <20261003101944.596546-1-yaojiale02@163.com>
Subject: Re: [PATCH v2] wifi: ath12k: validate MAC/PHY capability count
 before saving
Message-Id: <179155393366.875832.2344232704269907910.b4-ty@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 06:52:13 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 7Q0dC2Plw-n4BfRHmHdugN2_LuU2xIGr
X-Authority-Analysis: v=2.4 cv=GpbXaU1C c=1 sm=1 tr=0 ts=6ac8f190 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=E-bL4xMuqhypF7ioYwcA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfXz+zgYqF1JyQ0
 KT2R5isEyJqHhWuQMkDO3K+YzLwq3qT5OxkODz6JPWmRpsYc5WIXf8KNgz1Hua4l6PAly1ERR0D
 8jYAwi4KSXwSv8YF5HJczQ9fcg7EDoY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfXwfLFhGHXw87e
 fqbYV1gRB3bPDGZAcCjRuCjdyA+jMgFUeU/wrDBn7AeaH4yokGfRZCW2GQNWT7XOJCl+yQ0vpnG
 3m+XAeJH0bZbeEXqdw6msPWBPXxGz3B6vjKCNoxP+rZk4ZtIfASwEgZBd2Z6fbULUTt2IQc/2MM
 +D0AYUq0rX5126wkMLZBuKHFAtcHlFmsZEIAw527yDTc4ucTKfoVYlvi+Ghib5H4fVKXOntXH8t
 fsEPbCQm7kAv4UJJVsBmy4l25mthOcRvkAI/QuQEc7phXEwQD+R+ZSMdsYxW+0T+cwvpixmEhoO
 7uKnpLdbPmh3e4yoAUU250ZtcuKq/9uIJJlheyggfngzJSlQMGPt8oDOiKjKlSeD4fSjByaX230
 OYvhTv2aE5n1xirlzuKoXhg+FASmQjLN7rixaXAVWx9mzrKEcKsP0hPf1UZtlgVo30UOoizXv2Y
 0IEw24+4P73D4mmUn3w==
X-Proofpoint-GUID: 7Q0dC2Plw-n4BfRHmHdugN2_LuU2xIGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_065217_552459_7979F930 
X-CRM114-Status: UNSURE (   9.24  )
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


On Sat, 03 Oct 2026 18:19:43 +0800, Jiale Yao wrote:
> Firmware supplies the hardware mode count and the PHY bitmap for each
> mode in the service-ready-ext event. ath12k_wmi_save_all_mac_phy_info()
> uses those bitmaps to populate svc_ext_info->mac_phy_info, but the
> destination is a fixed array of ATH12K_MAX_MAC_PHY_CAP elements.
> 
> If the total number of advertised PHY entries exceeds that limit, the
> loop writes beyond mac_phy_info and corrupts adjacent memory.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: validate MAC/PHY capability count before saving
      commit: 86f2537877d6029487811bc3e0cd9e086a196000

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


