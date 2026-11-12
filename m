Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B05B606A887
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 18:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zVmm53Ce;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kR7gqGW3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XpOXUyOD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=; b=zVmm53CeVXrx7S
	O3WpKhhUhi7oeGLP6CCxLzoOEqwNf6NdBagj1ZpfEJJ/R11LvKOvt7i8thDxiWedZo2EDiij5hYIt
	qm403Pzqjif+plwk2WnYCLEThUr06xLuUbyLKEui/EOneDblW510SoGqLMZBKVrI+QjpJuAG8d/9g
	CeaCkdqSO4qvoTu9etutHr6OcIQfV5zuYJmLHST6atnVaUj3cDcxx+Vn7yb9VeOLKMmPDZi7A8xXn
	AaLu9yNWFmxgQ1VftAQ2hvWHPIe2i1axCpQd6jDwzkN/VkzevVHiE3prf/SC5zAZGbIQdALLZyXQK
	5m0evd5XHkRjBgur/98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZjF-0000000AsnW-0kT5;
	Thu, 12 Nov 2026 18:40:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZjC-0000000Asmq-1c6N
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 18:40:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZOLf2593680
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 18:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=; b=kR7gqGW3gNo7/jGp
	m3FfjZYNdIisd5P4znahl7/XdlXgZW+srglDsTB+gm0Gseg2b6dNAsaBGbM2oGia
	4MqYVTyZLr9TcgssRiB2kDm0VSnvP7KZDtoy5ZlpUiyNHAPWsCWfaNXFxrHxZDan
	AfB46TveDYJvsVoGoTxAmBr0bFO+EQwWrVlc++hquqNyQ3nHAffIu1mVPZIe0oDP
	1mqZJN4h1Cs1M8kzefWXapkhzfC0wENHxMy0GMpRPl0rusbR+3DYgcOZYGPFadUp
	+tS3iHoHmCXzpiW0HLkDdQ5KN6rOXA8YHjBEPHER8/5xGuv2cR0FdiYfQSPSM8mN
	ydddfw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx31sum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 18:40:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso248795eec.1
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 10:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794508853; x=1795113653; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=;
        b=XpOXUyODHfbNLoJm5vfLZY4kJYq+GL+n8LIoPQJbepgLlgQGX2qcA9Z3S8EIW0h/bU
         DHMrw5+EsU9hFo4PaADK2av6xvRhsYYjBb0RNOKhbYgZF7vAUVPFtrWospyf94ad/4I7
         ceVVmXkiHuUlp2r1rQR5sTNnfq9jq9vcufAVAMGH/U0C8qLWDY68JHVkFfzCjkk7tCzv
         d+Ja9OqPyv9DdTU/B+2hbuY5ReJmm0YoV15Ia7P6nwdM6epZWa00UKqJxapE6nvmQmOF
         uj+VRLKTh8E9Tegg1vuU5cRyJiHdaq0QRvSS9zxt5kj7jpAeJCmQEQgYRJXI7CM0Kscj
         uz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508853; x=1795113653;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=;
        b=BNbiwrN2IR7ryeZJncmdzzsgBDbkUYvzroMBOas1dFm60XVuO8Kg431Gdz30D61mH9
         vZNfU63M+fP1LBw6I53z/ww5GHPWeEr3HePmhUfyduRsq+6Yxv2o1+R4rKV7YffWGvsB
         B4WUdttLSuuuDJUZgoRsoSb4CwhPS3UduV+zFv1ek88qof2Oeu5C9mV2DG2TjV5ahs3g
         /3GC8iAyMs+99CBeeMozvTsF82ynHD+upDywS0ONcgo+fi1q6MqAe+PJADSN2bMhCJQq
         iboVoD9I3nOvEVydFqPHYJSWx81mn3aBuMCnFlv3ynbRW9jhuEg5hyedAqJcL200CvP4
         XT+A==
X-Forwarded-Encrypted: i=1; AL+hErG227Jp3GtQ9DIoxMxrvJCFyKkmurHWuTYhORoeRHBGo93oaylNYyq9P5YF/l1TKRCyDYZmrMc=@lists.infradead.org
X-Gm-Message-State: APuU4Z8MWnB90mjVlK46CQaeYAIrfscPZfhscE38z6T2OUC8+fIir8jq
	y2/KN3FUG8I2OQIwJsyN+oXsYaVuQXmI8JQWNPkJpsZGttPjSBEbsa6i8YydEsluLa3m/l6yg9D
	kNRNaWXA6H5U7irlXBEOuE+kpdQ89x6+uJgzDGLanJAfmbsxIv5L1VesFv1zwfaPn
X-Gm-Gg: AYBFou2zr6nP0s8CeWqCPAwyHCatOIrw6G2rnLKORh07f1BVZULg/7lCwCBzuYSXlHh
	5aRV/nWQ+4d4vdRcToX0sYmENFZtLmdJ7tIfr8WchZtGFmodXkY+qq0MAD3B7oDK9ZEfhFvpI7g
	53On1nEry99ByD4cMS62OyC5i2O4WWzrKXubhPIgrw1x5vvZ7yH0RJ+UQQm4xHwfV/s5SlKUJr5
	iifKUF2BQhE2H/cTiUWl+Mr48LQ79SJUOhyAOgAAASsmYbHOUeIFYk1/gihAktwSNbFeSV0Nclk
	kuCuZ72aKzOuEaXzkDX3CxrAYHfqBrZUym3bGd0yLzz8S1xlfJTZ2R3joyXiAc1islJPJGHkZWG
	5u+IsI1owDtu+z/+Eo7/pl7GN/JavKfwtbBJYZ2xLlQxjywnrclV59iozLij8mhRSkxR/1ZefQ3
	f8VIwit5yfMzR1ANjsDg1CA99U7CJz
X-Received: by 2002:a05:701b:21d3:20b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b5030d845emr301362c88.9.1794508852773;
        Thu, 12 Nov 2026 10:40:52 -0800 (PST)
X-Received: by 2002:a05:701b:21d3:20b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b5030d845emr301323c88.9.1794508852098;
        Thu, 12 Nov 2026 10:40:52 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm1204910c88.9.2026.11.12.10.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:40:51 -0800 (PST)
Message-ID: <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:40:50 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too
 short for the Michael MIC
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111080620.244164-1-julius@bairaktaris.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111080620.244164-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af60835 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ZjrBiyIVtDbkfVDLAEoA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NCBTYWx0ZWRfX/mB7CRAGdbjn
 L17c+JRjRNAfzO8X1XOO343879d7oavsPiDNGR/RV+Lk4kR9LHII2LKX+MlNPItwS3UEI8l2iNg
 UbHDl/uo4Hy2NL38dHhqZXaa/whJnG+D/IpB0XzJbO+jVv96omDr4YwW0QU5S7TobPB7RT8fBrF
 OyZ5GvC5BbgcNDOIS1GDo8guhoVsF46k7MajukjtgzhRjn14NhYXec1P1wn52J1ze9lfp5RhDgL
 lvm8Feq7S0+Br5x40cpE/UqHHairxnahNfcfEIsvGg8y1noMmSoq68d7svjx5gkHy1Rf4hFBCS6
 1f8s+Gdn2dfVzYl1HpnesYCbJEJ0Ar0oxkSU0xTcUQU6Yeu17H1Vq9/ubulkZd2btsj8oGMYqiB
 Mv4VWs73pjVmdIIG2QkDaqa2ghJp1PRAWeSfPBtq+W/MR6Lt40kGye6w8zyaZyLylRFYVTBx4k/
 0h63rIgK8/sbY9+ivrg==
X-Proofpoint-ORIG-GUID: Xx26N8oZglneGWshjD20btMU4W8IHFg-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NCBTYWx0ZWRfX79+lbuzSSwEF
 +p5zNCyNilHSnmt6iqneQdu8YtrZOVPJz6pjISnztBmht63XF3uRQM5UzW/QhcSJHqT5WG3c0os
 rsdRIi+5wmC6xE5DgLQM7HXkWquAgGU=
X-Proofpoint-GUID: Xx26N8oZglneGWshjD20btMU4W8IHFg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_104054_758392_56559F2B 
X-CRM114-Status: GOOD (  15.51  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 12:06 AM, Julius Bairaktaris wrote:
> ath11k and ath12k check the Michael MIC of a reassembled TKIP frame in
> the driver. Both compute the length of the MIC-protected data in a
> size_t without checking that the frame is long enough, so a peer that
> holds the TKIP key and sends two fragments with fewer than 16 payload
> bytes between them wraps the length, and michael_mic() reads on from the
> skb data until it faults. Each patch drops such a frame before the
> subtraction, as mac80211 does in its own MIC check.
> 
> I used Claude (Anthropic) to help write these patches.
> 
> Julius Bairaktaris (2):
>   wifi: ath12k: drop TKIP frames too short for the Michael MIC
>   wifi: ath11k: drop TKIP frames too short for the Michael MIC
> 
>  drivers/net/wireless/ath/ath11k/dp_rx.c       | 5 +++++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> 
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d

Is this a theoretical change or are you able to have firmware pass too short
frames to the host?

Maintainers are being overwhelmed with "fixes" that are theoretical and which
do not occur with known versions of firmware.

I (and the stable team) need to spend our time on exploitable bugs, not theory.

/jeff

