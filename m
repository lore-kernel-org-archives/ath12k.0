Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2DACD6E79
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 17:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0o4A01Zx9wgjGmnTxMlZfyWj+VDfhGQEUZ0E8tBG+U=; b=0H5ac073/1o8hinkIXsIHbwdas
	UC6Xwv4Ee8tE9oF0cDgekHy5Eb9IbrFbSo8pYJTBOJD78hOmY5Mslyl81Twbkun7gCMwchVfIP64T
	btxP05zDG2lOGKsN8X5aih0/AycOSO25t4ifObRwyMhiUfP2ZJVzdbXmsjup+HhoJVSGUWmuPPOHq
	LWxlusWMXaDv3cpwEoiZ9Qpv2OxAW6MjjsgY0SU0KiWeEVfhcD3/wq6RNdTkuS1ura0tFFoqHPQtz
	s9N2BgHTdhn2Fcx+wwJ6O1iTAFSmCw8Up1BpOQ3X5YnhozEal/9HLODYI4xOnd9DVk6BNlUTdoZcy
	i57pzfRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe9x-00000004E3l-1ngC;
	Mon, 08 Jun 2026 17:53:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe9v-00000004E3I-2h7J
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 17:53:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFTdI3971286
	for <ath12k@lists.infradead.org>; Mon, 8 Jun 2026 17:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0o4A01Zx9wgjGmnTxMlZfyWj+VDfhGQEUZ0E8tBG+U=; b=Yr98avpooiWCFBBH
	lVs5U6rvIEpIW5P6S4f4CItVUxWli3WHZBdgS5mp5r1Je/h0lTZRc78kDDOrficG
	WIAy/SATDF51efn442zIGKoKtuA+7KosUG37Jq47cKxqxwuDwdSGUhs1Dok3L35S
	du5KHYmQNp6thLj1tMXDJj/lionibLaDsA2n4+PiItjmLFqZW1btwQziPWgLOu2a
	cPftw9dU1FbPLQgfqBUVtqNDMH7Hr1oKgWE6EWWqmprVw9lx1l1lRVgiIXMPNlYi
	vXdnh4BBvLCoiX0ZJws26sQErGDbP1VrYVrelXjeaJPW81UHHe2KMtUWPMyCgKjT
	/B0iAg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptj7b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 17:53:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so34027175ad.2
        for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780941189; x=1781545989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0o4A01Zx9wgjGmnTxMlZfyWj+VDfhGQEUZ0E8tBG+U=;
        b=Kd4LSMkmFmENSOpy6BbsKSFjG0z4iKiN5uOcVV66WI/gOA1ecaXTQ89R9t+I3AbmZi
         OLAJ8X2E+sR+8AZaUq4RBGqf9z30TvwoWDGfF0QdU8j0ymQDUxDCGhL61wAheQeYB0yh
         JK/55/v+Uvc4OH+h1c6N8sy9i7tu+Ohkp4GGd4UxMFMV+S+XlHZIOqBpIVYscPt47OeR
         VlNlkobf+72nqNNAhoud+qeydZusxsto2SVPXB5w5TKvDmByv04PadLzg7RO09kW+Rie
         mNBI9kRIifBxYIcp6PNBEbJ16Auz/r7ki6wQ/y0asJtMEtfsXYOd4OnwC9WJJ0DJKBFX
         ds9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941189; x=1781545989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0o4A01Zx9wgjGmnTxMlZfyWj+VDfhGQEUZ0E8tBG+U=;
        b=XI1COFiPgo89u/jXjHlWdkdor4pyRU/rPlrevHHfAnTD52+KmB4UEBRA74ltTa+1Vd
         b7Fke+oZJBUGZd566gBXU5op7uSjrRFGrkNH6hNA5qUBM7JJYbT0u5QMwoezKqWKUYE5
         TfvhhP4SmOm4SlA3jDLK6YcWDAQ/sUrH210n8NrsUcY/toI6c1sLdXx4RW839aNBCQME
         F8KwTtEeJjr7f79704gelSqIRy7ATrb3lh00w8s1rRn+zuCxBB90O/HdJq2aA64gE1uQ
         WKB1fUtq+zayByxL9Wu2zRHuYb3fZR0fNl0C9QTDwVMBhZP1zvHGuwfrZgcC2VCjBk/v
         hxsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ep8/5tSaYteqxipJ8fpMi/5/TQFE7+3hSJuavH88r3XjNpJzrrwqXSwSLHccBJg7gGUaEqyg=@lists.infradead.org
X-Gm-Message-State: AOJu0YznIRJev9jWuAPspRwkTeWb5FuchZfytUSMaP5X/fR484rzx8BZ
	5a/SVJYwgRcdE56oLq1BVjKsl4uUy8/4rstu2A/K5z9C7uB70OIfIUVBnFQdyKQSgs9fPer6tVg
	yHvWsZPp2VWgovUvtqel94INlOAf7CJBhT5lDjlv0uDWAd03tf6KyFnfkmKnXfMObWFfCeMYS
X-Gm-Gg: Acq92OHFoXx9m2ga82Gn09EoFFVvR8GKF/4DoyFYwTrLFZ5xJmePZJzB83ydyEBqDJ1
	KxJ8lo522vLInK4P2BYNMYpiY0jlsFwlBhouuTDungoJT90BL1hBwELQYrZdThwJ0fAQC0Bbp7Q
	W6+UDMAAaNfmStSaAXUIQCrdY8O5E75jWxbqs/qAlgNjSYtcT+iwjM8hbosYRo0Mo9Ss8pqTiui
	/H2Uwb/N42yPZM04ouzxsHE12JXgPH0I3rejBSVz0J9B7bZsIqQTOvCC+N5ggHllDY1WXSCoUMu
	qclteTxEIk7QM4W5DJK2PKbrMUTXnt35HQ9BO4x01e1uu5OXV21TWubgJ0WruUFSb7yB2iEHTRV
	XSRgpY9oBBpHXQ6ZnHSFCwi3VSZiq3AjF7Uw/GcKJ+yidRe5/tUD0HZC9zw4=
X-Received: by 2002:a17:903:a03:b0:2bf:2b84:c207 with SMTP id d9443c01a7336-2c1e8331ff9mr111298705ad.35.1780941189242;
        Mon, 08 Jun 2026 10:53:09 -0700 (PDT)
X-Received: by 2002:a17:903:a03:b0:2bf:2b84:c207 with SMTP id d9443c01a7336-2c1e8331ff9mr111298445ad.35.1780941188594;
        Mon, 08 Jun 2026 10:53:08 -0700 (PDT)
Received: from [192.168.1.8] ([116.73.159.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e2e2sm184242265ad.49.2026.06.08.10.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:53:08 -0700 (PDT)
Message-ID: <e014bfbf-1144-464b-aeba-c7f0f58e8b2f@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 23:23:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next 1/5] wifi: cfg80211: Drop unused link stats
 handling in nl80211_send_station()
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260607175912.2266215-1-praneesh.p@oss.qualcomm.com>
 <20260607175912.2266215-2-praneesh.p@oss.qualcomm.com>
 <ba13edbcfa590fe2bd764719b843e6ee8c675310.camel@sipsolutions.net>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <ba13edbcfa590fe2bd764719b843e6ee8c675310.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K9GVF7vfkVA34MZeTfco3GwqvUR0ZZb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NyBTYWx0ZWRfXyYxhe/apkDsd
 n+XNIfm9FAJFIPL0MH9flpMyjLd8J7BA+mXhoU4jJIIc8i/fO3CfR8kV7xZSH1CnZBhdBs58cm6
 hHLpioI92xOoUUR5UhNiO6hzfW4ZZyfQL3tHeWp0Dl/dxptITenSiXkUJ5tLoqCptc0FLE6ONHs
 CmdOtpcL7YGfYkoQgT8Q/1stCiUyMP0/Al7dP8ehO8phwF1V8BUr4tMTAZ08unsZvPj/gd7H5sv
 yb9LEgXPurXHjaR7w9vYWjHO6YzFGDjVj91FbN2eR04sqVu7SnHNay/kJmEZFlnnJvZ7rMvEPEr
 ltp9HWWcgdKLp7nJ34iiAxCKnYmqDDwwmJJpTJt/8iqgQAKK46iLKQ0nqfntmu9vWm3996HU8+R
 SPRYw45CFfljiRJ8NQ5qN6x1UOnqbF/5c7/PTEojStgcDdZez+zDvqgJ6VSeWAuh8sjAaBJZH7s
 0Rsh3NoFc1m1586KV2Q==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a270186 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=0XKIscjZuezYqwSxLmfFhQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=_H_or78mt1J3sE7v2EIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: K9GVF7vfkVA34MZeTfco3GwqvUR0ZZb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_105311_805839_DD0B32F9 
X-CRM114-Status: GOOD (  11.52  )
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


On 6/8/2026 12:47 PM, Johannes Berg wrote:
> On Sun, 2026-06-07 at 23:29 +0530, P Praneesh wrote:
>> -static int nl80211_fill_link_station(struct sk_buff *msg,
>> -				     struct cfg80211_registered_device *rdev,
>> -				     struct link_station_info *link_sinfo)
> It's a bit odd that you're dropping this only to reintroduce it in patch
> 4, but I guess it served at least to notice that:
Sure, I'll restructure the series so patch 1 retains 
nl80211_fill_link_station() as-is and only removes
the dead link_stats path from nl80211_send_station(). The function will 
then be modified in
patch 4 where nla_nest_start_noflag -> nla_nest_start is corrected as 
part of introducing the
new per-link send path.
>> -	link_sinfoattr = nla_nest_start_noflag(msg, NL80211_ATTR_STA_INFO);
> all of the nla_nest_start() calls in it really shouldn't have been
> _noflag in the new code at all.
>
> johannes
Understood. NL80211_ATTR_STA_INFO, NL80211_STA_INFO_BSS_PARAM,
NL80211_STA_INFO_TID_STATS, and the per-tid nested attribute are all 
properly-nested
types and must use nla_nest_start(), not nla_nest_start_noflag(). All 
occurrences in new
code will be fixed in v2.

-Praneesh

