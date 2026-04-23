Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63866FDEE2F
	for <ath12k@archiver.kernel.org>; Thu, 23 Apr 2026 18:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDahGGWgE+f2YJGiyUkd+oixBxcr9ibcWlJr8Hhfk1g=; b=D46SITKiI34id8dmG7vNLAziRP
	Q3KCXhG+kVS8J0sh832sHIgr3BK73D1DdNZnnm/Fe9yRvuZaKi+rvjKxWDFfh9glixDIUphNwloCe
	6h3PKfdUQgkvYGjfNM6NeW8qvcIpKDg/zLUTn8iod4EpQinTxE3o6PrCT/lpqd/Yrnc+93yAC4Ojq
	I1jjYrHtyUHIhUMAP0nRCaQYa3Tuosf7T00El7CF4zJc9vEjdmypaUN+YQvdLeRcWBl+lt9lRTg1v
	UzF3pWK7bqZjG3S/jUI7SJVjBM4PRowB2gvqea49eqND4FX4LgMq/B0PWBqVjO5uCMVXRooLzZ6TA
	/SdEDT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyMK-0000000C5m2-0ayu;
	Thu, 23 Apr 2026 18:01:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyME-0000000C5kR-1WpY
	for ath12k@lists.infradead.org;
	Thu, 23 Apr 2026 18:01:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NCk9sR3803940
	for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 18:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDahGGWgE+f2YJGiyUkd+oixBxcr9ibcWlJr8Hhfk1g=; b=dTw6gGBs+jt/1OHo
	0oY8vCek1sc7qU2nroAsyGufDMY3Rmke92kCZZGfH4ABOyV7MeSWV/76qB+dFQEe
	/fpDD5LVhNxfhPgOV9iLF6mMu3iW8Y66zr6M8U3gsoZsctoGhoclrvVfoi56QAWI
	utTb5i7herqbObHUqLuzFZNMhMmqYuX2ylHpKQQ6mzJSvwCEoDarrWxnnDL+sXXq
	NYA6gH88FWrgNjsPdp0KGiF3pF++ELEEhfdtgVUKt9sW7Hf3BbbpmAQcTrNubLsF
	OOAaCdj+gfedtkivFPXYHzIl19f6WFN8ywV0sw8EOks4dc+iZP3Ht72p8WXnHYA+
	sIbIqg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqkqfsabj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 18:00:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so6667215eec.1
        for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 11:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776967257; x=1777572057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDahGGWgE+f2YJGiyUkd+oixBxcr9ibcWlJr8Hhfk1g=;
        b=g2a1g6IasSkUovo62gg8LQ5ZAXBCMMmHfMsu2PPe8BB3AFxpYAS9ZVOB6rZ7izUwt3
         clS2/+nTfOde0PpM18X7c6TCdkSnHa90eOVYcdUuWMWiBAQxfTBiEbkF99cs21a5WwHN
         UGdWTg6c6qQuVGG1FoomwI3m9JYTpx33y4Uo13aTkd67RmIKkdZXBGlhXQPX3lki20QK
         OI4ODG/wml+vfjJhNys0MX9TiwJ+OJs02hxMkrbekwcSxnxvZSTl4Qy0U7eKsCUuv1Ww
         N5OuMCWbsjwzPjQgBih9yWp5U5Vsy9S+uL0wZYG5uyMEQApC4IcTbF0FICwy+ImXlkWG
         9Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776967257; x=1777572057;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sDahGGWgE+f2YJGiyUkd+oixBxcr9ibcWlJr8Hhfk1g=;
        b=oG5XrQjrr3cfOpRZi9wlO3zzX4quF2SJJ2yf6gvjylzZfz7XVNAMTgKToa5tJGjaSz
         85qxY+81H7rJa5WzXNLQusAOqY6lFrD9vDsNEXN7mLjNigT95Bh8jVDGPBbuyPEQfKMl
         p9wJPKahipv5ze+SOpX2FT0kKXnMKthYcvfUyjroi7dOFJMH+dAb6D6BEVsWa9YudwuF
         8xPfSKZar23VPdGUPA9KmfNTnMGdOFmxmAnUocfiYVYmblrW2nJgk64+9Xzj9kgKwy93
         wuko9e/d8/H3itq7hlllI4bG4gEIghUHSqchjKpiNNTGadrtNahx5ZNo5YPzrPxBtoQv
         suDw==
X-Forwarded-Encrypted: i=1; AFNElJ+pFVY2KO/vpBOs9IPi4oleodZJqhZ/nk63qIVXHJ5xrLdgeQPILgl0nPPGMoZWcr9oZsInrCA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzwaKSw+HxUmunsEYTo3r9b7hIH+jBNz8bvqyir9fDLW3as0R2
	34lZrHO1hF2jSnRrgcqoZQFB9ApZiVxCTqMD79f3GSRZxMNmbxw5XzmCc6fTBQOx1vrgIK05pKE
	857p66/exXiR7+F5tbpFU9W6N3aynbSWyz0CZnnmRSTNBtBrNKnMhFiDWg1FldQ54
X-Gm-Gg: AeBDietcE3rimY67GeFemFM6Ivb6Pn645N1zteWK0jTF13I9zJpDeZCUB8P/XE7anla
	IvCiy6PhYrKyIdDPDlC2DARGYMNLIO3WGwV/K5iBKEtvVthg0UkTzlhIfqZKM4mnNzrKfLMN0gL
	LeVlzeMOK/bI33VfEixAssLJc2ZMpq/WTgpyP9+JZ0X4iOwKBj0JmUhxflWhva+vklrpITS/s1a
	DSb7hD00byrmseIjXd/UnXnPXhVZS2/lnkCZFheFXFCdBBBa85kK+KSlQ3Bj7m/WZMEdOBUAQEl
	nNIro4yKvjtAOi1S7X9P47nyXLA1fTZHFJZHTjKPUFHjJmXHrQ8XWxn+78uyCPqeBwEEn7vc0Dt
	TT56rrEn9tZQtQ+TprSj+Ilq3Sc/QvLRmwc3ZyIYmi/m0KAxbGcQ6k4hB3FovzfqvI5d1XxmRII
	ooVVQhm3gHo+s=
X-Received: by 2002:a05:7300:dc88:b0:2be:171c:5048 with SMTP id 5a478bee46e88-2e4646cbd46mr13880342eec.5.1776967257052;
        Thu, 23 Apr 2026 11:00:57 -0700 (PDT)
X-Received: by 2002:a05:7300:dc88:b0:2be:171c:5048 with SMTP id 5a478bee46e88-2e4646cbd46mr13880303eec.5.1776967255955;
        Thu, 23 Apr 2026 11:00:55 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm27867887eec.2.2026.04.23.11.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:00:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260210-ath12k-rxtid-double-free-v1-1-8b523fb2886d@oss.qualcomm.com>
References: <20260210-ath12k-rxtid-double-free-v1-1-8b523fb2886d@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: prepare REO update element
 only for primary link
Message-Id: <177696725494.2493545.13936818593082724681.b4-ty@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:00:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ZZ5YsqyWpBomQ1cKmldvil7xn5BYsv6N
X-Proofpoint-ORIG-GUID: ZZ5YsqyWpBomQ1cKmldvil7xn5BYsv6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3NSBTYWx0ZWRfX17el5GZytiCD
 CVNZs/RG9Bz0XP8fRLnTEj0/V7JuSGRUYiFPOTlzWVdoakEKVB9OcU6wGnZFDjc8adK3iT3jQiC
 l3YzronjnJ6pyir1rP9pCY6b1ul6qf1TBrgz+hzRq0AzYwv3CCjWAbuAdyQzYALH+nKbvhYWVF8
 Q0St0nnZDkMDXA8UICIYg2sHFLyiEkvq0i4LBYjikyxlTsogDrKWcMeY0zZrTF5SOI2FjAEUVyI
 RhVmP5gCfuysmz7xNVntqpxQ42oJJLOPscWZtaONs9IjwJY+E6xnOwOXpbKa/uJJJKQJRlmPaDx
 KGEJKSPM5eGfXoUiHgI/fbhP+mt3nvFzGB6IK3m9gtI0KmXuMC42CjTMpppvSP7uLda9m/qWYPa
 X30Gwk0PiXao+1iS3EcQM665UjUqzXx0wT2NMotOzIaxNR+FxjaCzizu7iZze++I+/uZafZpx1f
 9AsaJeYyeNLJlSDOv2A==
X-Authority-Analysis: v=2.4 cv=ablRWxot c=1 sm=1 tr=0 ts=69ea5e59 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q8EUVOj_abkwYjJFVU0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_110058_429232_7E97F89C 
X-CRM114-Status: UNSURE (   7.86  )
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


On Tue, 10 Feb 2026 11:07:31 +0800, Baochen Qiang wrote:
> Commit [1] introduces dp->reo_cmd_update_rx_queue_list for the purpose
> of tracking all pending REO queue flush commands. The helper
> ath12k_dp_prepare_reo_update_elem() allocates an element and populates
> it with REO queue information, then add it to the list. The element would
> be helpful during clean up stage to finally unmap/free the corresponding
> REO queue buffer.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: prepare REO update element only for primary link
      commit: 4a1b534177395627579c1fb9e7f9100ee88955dd

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


