Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1D8606A32A
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zcaXVSe3;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kF5My7A2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQo3Rlaq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4wrQkMaK+dW/8z6fl3qfa+S+gShoibCmJmmER0g7vrM=; b=zcaXVSe3L9Mu8U
	uSVMS75OoDKrdfd088NgCuMx6+mzkceXeS7rXQjOlB/ULK0OSbdyH8TE71tTv8oCDHO+m71O9czs4
	3cOIaetUr/lpLhKsgMrmINiZgJD/CVlvOjHXst01Duj0Vcke8X5Lw+cnwvh3scTKlkNlrKsa8CbWc
	HDXlKiwaPrjl3H3ttRICWLTx80EW2ePWw/BJvDKJye0UxDljn4QrnFhYiOmboCbRMUKFccODoR624
	juts+OtWI9v5EPpPEyR4VUmQkqiS0VEoFuk1GDk+XN9K6KaodsnLJPqeEMBf6sz6Cebsb7vXlEPeH
	PTlahANdwu5X3DiJNtJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcdg-000000042Ad-2jE5;
	Tue, 27 Oct 2026 08:34:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcde-000000042AD-09YJ
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 08:34:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YvRn752075
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 08:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wrQkMaK+dW/8z6fl3qfa+S+gShoibCmJmmER0g7vrM=; b=kF5My7A2IRd6QUBi
	LDTYgdiZ/J3U/lZ/GtNQZpoNmIiPeD/WZfJ2vEo+v5WVHLqxlGvePKQH8aOLYeB/
	JNQ7aOJzzqefKSquofAmkbedrb5n2jlEQvZSxXa9tkajc+Ku2+BqMjz9IkEb/9tP
	CjgoVSDwqgLw1/H/4j6gu45p5MUH/4XoiH4djvxfGAhaZ+txFJ6DRxcLm0wmE8Pz
	Ii0eD6WaM92n9RQdEqhrgpBocvY90oLPn1OX5k0n/AzxtGukDq8xYvipujlZrbnw
	F1Owy/Qb1vLiVqIARITwyXQvCI33laY3SizEWol549pAazrsgAN0gBvGIN67KjM0
	eAWY5g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmapcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 08:34:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so2922275b3a.2
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 01:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090072; x=1793694872; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wrQkMaK+dW/8z6fl3qfa+S+gShoibCmJmmER0g7vrM=;
        b=RQo3RlaqDxJOIYS8EnsfzKUgmFPWoTDhTsH9dkx3oUdPWVbmlk1fjPaT3CDtMNYafo
         89tJZFm69h7ezpa84shUIOqclFyJ8VEb5gO5xuLZbAHTCFhIxZIWt0CZfzp7uO/hawVy
         p6FP0gt1vKWHicD44vB6pYSZjJOuutxdE/ogqo1Tguxx7Zt9gu3YvaLP3hXsc8583z/3
         t9uaIkeb7ycYHKim8uKweLMds5eiQwPnkg0qeiCr08a7K1QhZEk44qdbc/jR+jyUqHiy
         m1Qm9ECy69uQTOyoUoE5l17fmLbcjetEPcY7k7g/D+wXy7PU5M2Un3QRH6nwZ1yKqBMT
         gRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090072; x=1793694872;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wrQkMaK+dW/8z6fl3qfa+S+gShoibCmJmmER0g7vrM=;
        b=zlc3EbcjGPZ2WTITexD6D9NnbIQwGMLyPp5FCCT75gE9lbGtoV/qCShzfXlMKdmq0S
         MEXnWZvWoIuJsLeIoJPdcYNp3VidAz7+eL0hu5JpuJAAWYV/+kQU3QBHZvCFHkj4EmD7
         y9DTr4wSTYSgo9A0qfZzypzqKv1q9clOXib/jgMY3gj/aZ/obo1T1c763Y1kvTk8lurX
         RXCgXj/CLa2WbHd8ImnvNaHEDhPGcwi5wwf8m5ydUIqUGIBfijd0DNtH2irq4QwflLMg
         lV45VDrWLYLByxt8+sa4lpRTf+ix86TpUzA3w3Uxcf/kytoQ5t2qJVkcC5O7W7RSAGHf
         DSNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWb0aZRcu9zg20Le9WIA678ob8krSzfpJywsYNLlvS8F/fV1+KZFfqaAoGmehnmAGyM7+g5tE=@lists.infradead.org
X-Gm-Message-State: AFq9FYINutkAfC3R0iPavaKsNRA+RfirfkTsIOQyZO7z+5moaOpbbaN+
	B7UdotR3S2uQu+WaocS2ijXwnqCp19pbGyPXfqVZ4mtxbk6+q9eIrbYccd5ewUPjMbrDdwL/kHw
	RolcLIsDWgXkU4gNwbvmMH2TmK+C+KyTBasgxbK/caK4Qy5q0PqosxR1SwLqwQ2a5
X-Gm-Gg: AYBFou3NI5OZXdnzjXQ4Orkl9GYOjTkSudv/+vmchZilioNDljexwnsTDHpB0wzouwY
	tjPXF8A3zy8VavHAfEdTQaw/nHaPODLRo4u5BDs6+0gYgU/OWXqzm1l2kepgrnUceFWnjD+b108
	L9etfxYVYrzzxrKb5SmkJx4rPg7B7VTox6oqM9wlkko195yGP7+Yrswd4jFz7edkCKRARUAa1YN
	0COgN1jdKGE4adEXQO1F3+k3KwW39o9FM3Gl4TiujpjvmOoU7RsThWQI8Vm8APxSO61FSeRhKlt
	SU9EsksvId906Lt47TetjiFxMPdoS8nQb040JjRSqMkPjqHfPY0uawxHT0b4gVCmqbMd4hF/9Of
	iH/0KkOwU98iz8ujtRhwxL9TJ35RAjwJ7OGwVPRy/I4sTJa90dO9tek+vNBp8k2WmWJI1ljJ+sA
	==
X-Received: by 2002:a05:6a00:1889:b0:89e:7bfa:f884 with SMTP id d2e1a72fcca58-8a367a3cf01mr7107760b3a.18.1793090071572;
        Tue, 27 Oct 2026 01:34:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:1889:b0:89e:7bfa:f884 with SMTP id d2e1a72fcca58-8a367a3cf01mr7107751b3a.18.1793090071132;
        Tue, 27 Oct 2026 01:34:31 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d87afasm2119266b3a.7.2026.10.27.01.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:34:30 -0700 (PDT)
Message-ID: <87eb6978-74fe-4ec6-b76a-b09210ceea7a@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:34:27 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix lost 5 GHz range by
 tracking reg ranges per radio
To: Ahmed Essam <mrmrmidoessam@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Shenghan Gao <gsh20040816@gmail.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <bbd65b93-816b-427b-8abe-1d1fd1cf4e70@oss.qualcomm.com>
 <20261027015919.277156-1-mrmrmidoessam@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261027015919.277156-1-mrmrmidoessam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXwSinMxu7QqKf
 P7sVdX4/Epd3H2HE41ZEIPVFkG+Tc9ZdWoHDgEGz0dGAfc8jOm8oq1Sj3FAAmkev1JUJvFBxHQP
 GVbORlhB7rnqMlMMJprSy0bAIHCfEpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXw65FfwMZGYQF
 bAv5C2QfOjIPeZKZDk7xGYwsz1GXc3e1nvhEjqf6Qkw/Cpv0Ss4JuyIfglQRL71fxD4jG9icA+X
 ZNIxbFbOFQzheSp3qwT60eh/zavwsgbLw6BGTeN8NtrR7LWWrY1NMDf4qr4kHPpWpQ+a9yTnR+9
 DUPuN4XSEs0lxg97NPRS/remOQUYOAbCechijQbd5c5wsSrh8Rpd0y0HQwBKzkrtBqlNfTe2+UU
 CpuUZf3ZSAWLpkHxcwWl2u28FxZrT+GENWFk49vQCC16BLN0lSYFPoLBW5XcTUTJYJo3nJRHfxd
 XXhPclKPKIkYXSyLpnA0LhvySJx8PfCvO3m7YfYCjUZX+tmBLMRjPR9XtgrUfhWYjF+f7NyE9cq
 ALYjxucTSh++jl6dfvbrCeYq3MpgVizDYW2zaaNmCaijFZkiN6t42xJLzgHBdmDiFDf9QmlL9HE
 DUHkt0ztbWzyvR/F2YA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae06218 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JLF8xD7Yat_ry6Ihdo8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: UD8-q8t78Y6t4Y2GneeLVN-Th8y60i8g
X-Proofpoint-GUID: UD8-q8t78Y6t4Y2GneeLVN-Th8y60i8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013434_317491_A4AB81C6 
X-CRM114-Status: GOOD (  20.87  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_PASS,T_SPF_HELO_TEMPERROR,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/27/2026 9:59 AM, Ahmed Essam wrote:
> ath12k_reg_build_regd() records the frequency span covered by the
> received reg rules in ab->reg_freq_{2,5,6}ghz. Those fields live in
> struct ath12k_base, but firmware sends WMI_REG_CHAN_LIST_CC_EXT per
> radio, and ath12k_regd_update() uses them to compute the frequency
> range of a single radio (ar->freq_range). This causes two problems.
> 
> First, ath12k_regd_update() cannot tell which bands a radio received
> rules for, so it uses ar->supports_6ghz as a proxy: the 5 GHz range is
> skipped for any radio that supports 6 GHz. That is only valid for
> split-pdev devices. On single-pdev devices such as WCN7850 one radio
> covers 2 GHz, 5 GHz and 6 GHz. When firmware switches to a country
> without 6 GHz rules, for example after an 11d update to CN or EG,
> ar->freq_range collapses to 2402-2482 MHz and
> ath12k_reg_update_chan_list() drops every 5 GHz channel from the list
> sent to firmware. From then on firmware no longer scans 5 GHz, a
> 5 GHz-only scan request fails ("received scan start failure event"),
> and 5 GHz networks disappear from scan results, typically shortly after
> boot. They stay gone until the driver is reloaded or firmware moves to
> a country that has 6 GHz rules.
> 
> Second, by code inspection, build_regd() resets all three per-device
> ranges on every event, so on multi-radio devices an event for one radio
> can wipe the range of another radio whose regd_update_work has not run
> yet, silently dropping a band.
> 
> Move reg_freq_{2,5,6}ghz into struct ath12k_pdev and fill them for the
> radio identified by reg_info->phy_id. In ath12k_regd_update(), include
> a band only if this radio registered that band and received reg rules
> for it, instead of guessing from ar->supports_6ghz. Checking the
> registered band is needed because a radio can receive rules for bands
> it does not operate on, e.g. the 6 GHz radio of a split-pdev device.
> 
> Also fix the reg_cap lookup for single-pdev devices: pdev->cap.band[]
> is indexed by enum nl80211_band, but was indexed with the
> WMI_HOST_WLAN_*_CAP bit flags, so the 2 GHz lookup used the 5 GHz
> entry and the 5 GHz lookup used the unset 60 GHz entry. Refresh
> reg_cap for the 6 GHz band as well, as is done for 2 GHz and 5 GHz.
> 
> With ATH12K_DBG_MAC enabled on WCN7850 and the firmware switching to
> EG, the range before this change is:
> 
>   mac pdev 0 freq limit updated. New range 2402->2482 MHz
> 
> and after it:
> 
>   mac pdev 0 freq limit updated. New range 2402->2482 MHz
>   mac pdev 0 freq limit updated. New range 2402->5330 MHz
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 657b0c72c4ad ("wifi: ath12k: Fix frequency range in driver")
> Fixes: 13324cecbb2c ("wifi: ath12k: Update frequency range if reg rules changes")
> Fixes: 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update")
> Cc: stable@vger.kernel.org
> Reported-by: Shenghan Gao <gsh20040816@gmail.com>
> Closes: https://lore.kernel.org/all/20260715065218.41232-1-gsh20040816@gmail.com/
> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-5-5 sparse
> Signed-off-by: Ahmed Essam <mrmrmidoessam@gmail.com>

Ah, I have an almost-identical fix pending internal review, but I think yours is better.
Thanks.

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


