Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024B5606A31C
	for <ath12k@archiver.kernel.org>; Wed, 28 Oct 2026 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wfSk0yj0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APAr7zfv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HgQlxpPn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fyfglkoLZqY2aZVrTKhpOEDmOthsFifGeX7ssa0eblc=; b=wfSk0yj0TNSSRJ
	rQJHTlunArKi/5bkPSkv4By9wlJqBFeaQGQiYN4IC5CSPcz5MK+N7KP9rPiVQA4gChjIzj1+osaQn
	R4KiZNF94q7Lo2DHYQEfmHR/1nLw0U/xS0DVw5R9M9fA4NOUgnSLUD0JRbNGB01ym+lFSi4XEoyTw
	DVPOwFIYnRvxRD99QST/wv6Eka8Gwnfs4Othw2tj93EpE321bbr6kgTYKER9xxJ/jkfnZgKJqIluK
	hzCvQspmaTuaUBFE9rTD4Xb862v+gYQp9ESpxb0UfrzMJDjsAJ3dphFc0/18X4zRxPSqjhNA1pkXY
	dyDS2TgDXPemJKh7Ooqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4uS-00000007EuL-05sj;
	Wed, 28 Oct 2026 14:45:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4uO-00000007Etd-31ZE
	for ath12k@lists.infradead.org;
	Wed, 28 Oct 2026 14:45:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdxJ14154553
	for <ath12k@lists.infradead.org>; Wed, 28 Oct 2026 14:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fyfglkoLZqY2aZVrTKhpOEDmOthsFifGeX7ssa0eblc=; b=APAr7zfvdOzwwt8u
	KcdGTMhRhSHHOQHPJOM6Zimc95yJAxLHQ5UIl3jtDesb8fHvDG6k3BKjqg+7n306
	TsNU0tjHTQwRUxcHesSULK6ixA5PSeU+9VkZ5BXfx3iN3rD1GrbTRM/tD4y9hlJu
	LCiqPuDV+C606R7MxROKZ2KtRYKVuqr4brKAZ+L53cPZp0rx/+UsPy9ogijrICeG
	yBVUUDL7XFrSdM/xPNg3PZXyGGcPcXX3vF6BX04XEiykif6zPG+7osHcmcE956PK
	K+MY5PfoSOU9oIScQJicZdKO7gQAsGf72xmQ8nvKlW0rC5ytl2P3RnoFRqOwEzHQ
	X0MZkw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1bqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 28 Oct 2026 14:45:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1161283c88.0
        for <ath12k@lists.infradead.org>; Wed, 28 Oct 2026 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198742; x=1793803542; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fyfglkoLZqY2aZVrTKhpOEDmOthsFifGeX7ssa0eblc=;
        b=HgQlxpPn0klf8tmjm1okb48wDPEKH6wwioQ8g5sdksX0YXS3BhqRCh6YWFPAKOLNrq
         5F/CCYpxlQM72DA2s7VUmU5wa48R3iL4ITiVFcawPvrxrE/3FSJ1OWbD95rpfVZgjRWq
         /hj1w5qoFG4sCjU/B04LqESdoHnHV9/EytGTs70RozLooYz4Y48ZEgj2MrETJM9MM09i
         yDiDQbWKYGhC1yaenWkMJG9Mxrwegjxak5xBP2KOkFzQj72fHGXC73dt+nGBSMem9scb
         zMSN+umtE7DOSRSEyHqcEYjiTb3x1o1o+8FJHJ5X34KNjMxWf8NwXvMZjF370ZN1EMHH
         OTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198742; x=1793803542;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fyfglkoLZqY2aZVrTKhpOEDmOthsFifGeX7ssa0eblc=;
        b=RLktWdO2N2QzFoPj4DsUIGwY6WDf/JQPsIvKdrD3nliU6qcPnJUVwTkaONGOeqkRBb
         WGhRkrG/wfv4Hn90DZUw5kKMOJE7u2f3U0lgqEYb5ASY5T1bU7ldhyE+0El6yD5NgCAc
         aUMsM0gqpqZbA5ClYL6C13CcngB6dsMacaqiMyXR/QHC2NXhbUTscDAl4iSS3rNgqUct
         k3Q98Xk6wy+Rzgmbp0XsJIzus0XN78V//l8O11ghaOgme1t+BajRRbW/VIvSQepfeBEb
         yWFHbgdP/u670ue2z+qIVtw+H+Axo+4Sm74274abobtoR8knYalkXAofQpSQ1JY1l0+/
         kieQ==
X-Gm-Message-State: AFq9FYJUqY8eh/rceS1djQYrUvfp0x88R59b5uoqqNFBkxJN1GpU2Q+G
	xyBP0h5vpIeY71foqyqx1AOPV2S4eqOWpYtX1qYUGsBnPXkgnf2udgp7WmyuFkJZ10YB6SXGx8V
	AAYhA7P/X1+uXvuZe5WDv565Bi12R6QQexQify3x1mc7c6SibcF2lyVG10eFFB4HQbeO/UfxZ
X-Gm-Gg: AYBFou2KnLnyS67I8X1SDuxfyFmkFgjWUT8hRFVAs+mdTEmUS+zdXoVyCc0fJQ0zHxQ
	/pXCm1KhS7WmlbdufiwRkQ8OcDsnUHvd8lcZ6Y3gcYJ+V1YCXjnU16DwvrnfM79s8yAbmMR84kY
	hYZm/xGvufu13nPBolD7kOvPZi5AjNY97G/T+8FwjOGsJWvFmb5KVG8ct6eDlL7qzRCbCOYYv+I
	M8itskpSct3gKNX4ZwGjZRIGwgcLmV2E24pi3JKuyXafO0mrvtN4WevEU2R8RMeNQ/Tzv17Rfte
	PolBNVCA06Dh53/uwTEApy0IQsPOMjivOwPGu9KnDPN8cEGh/3tSjhlSMvlAXLuUZr5rLr3nDgp
	cKoashc8cg0ud2WRCAxwYv24ogDLpqwtMxqTVeMQcgFenJsnqSIux3+zNKZ24rIfbiR7mtCQrQB
	aqbkOiNUHZ2pzlbZ0/IQWFTO2L8hc8wjsRKw==
X-Received: by 2002:a05:7022:fa07:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1a6cf446fc6mr4350377c88.47.1793198741469;
        Wed, 28 Oct 2026 07:45:41 -0700 (PDT)
X-Received: by 2002:a05:7022:fa07:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1a6cf446fc6mr4350213c88.47.1793198738967;
        Wed, 28 Oct 2026 07:45:38 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814aa1sm11335421c88.7.2026.10.28.07.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:45:38 -0700 (PDT)
Message-ID: <938cba35-1f4b-4d42-9440-b6f948014ddf@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 07:45:37 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] wifi: ath12k: service all RX rings in an interrupt
 group
To: John Macias <dencity7@gmail.com>,
        Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>
References: <20261025181955.2089498-1-dencity7@gmail.com>
 <CABkEBKZtaWkvxbhnOPBUjbh_iLx-Tyok0PskhduQk4O8qq=NVg@mail.gmail.com>
 <CA+KzPsoFGBe4PBJgjKQf-u+aeS9ckNALFjEkra_UoddRS1TPVg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CA+KzPsoFGBe4PBJgjKQf-u+aeS9ckNALFjEkra_UoddRS1TPVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UCeTBuaSK8Wuwqe0IS8A0btNxAGL5wrk
X-Proofpoint-ORIG-GUID: UCeTBuaSK8Wuwqe0IS8A0btNxAGL5wrk
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae20a96 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NmRTgjN7WBdEn4-ujX8A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX4Zd9+QJ411DM
 VlJ+PbSXCavk7513LiQmOoVdfZ++yX28naSWhbR6aOdPKW5SFsKb/DqPF3sfv4b7w4P3S5gOWSE
 LIBe4YRgYJKkTze52iC/ydCrD+iQjO72LqUdWOuEkM1ddx7S+r939hIGd0DWNWPh+CCPpwHtglX
 7GH998KR512tc0HksbSVTQyeO4dlSl1qo6DN6Q/JOZZCIqyxyVC1MKQF0YJtWamTnH9wwpRY4Z1
 clQ9sA2yKNISDc3Kdm+VteEuvonOuawDsHWQios6nIdE1pbBjvE86+Nx9ET3BxzfWv0hXpx17Y9
 DCO/neF1hPhW962wpmKJx01E3itvMpjNq+7OZphRWPHqfqAfkrRncItkjd04Z+yAr2fMU3rnMO/
 jpkf2naCyTeNoWm2LtsRcwERzcJiTPYjstewlVK9H2o5/r2P93TIRSyuTpTTChjNYVRb4AYi/16
 i0Wrc51icgcW/Ia4K6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXxr1xW+R8mctZ
 PFcFtTplDWWpjD6FXGL8rx4EgoO547jZl3bp1tI5CmYMJ8eDCugnMYY5xGXN8ilGLB3WoBt+uoz
 andjM1PyQAZdWd0UB4VrrCT7OK8tG3E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_074544_882590_605ABB04 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 7:22 PM, John Macias wrote:
> If QCN6432 support goes upstream, it should use a suitable per-ring
> group configuration rather than inherit this grouped-mask problem.

Please review:

https://lore.kernel.org/linux-wireless/20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com/

