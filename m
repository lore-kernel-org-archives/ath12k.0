Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75988FCC9A4
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 00:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=; b=ywXNyE4Fz6/DU0t97m+Kf6B61S
	2Rjl+tFVMfm5j2B8eTs0uUGGGk5qfCkSoE7rKXBXnZmix4vFjQuAKnFVOtzKz6qVR2u0oFkZKQkjW
	8+Edj5IQZtbdqNWcOQ9qXkeTf7oKs2Nyk/GJ5FyyCU1xNN2BPjbTMvW/U9BGh9E+1nvfeFm9a/tNQ
	PKllsHQXlG4DaLrXw9aXhcM3g6UWGTUlF6URW8yEjaL83OGk6YUj/eXFfax0yE2mbRapQusTc+1i/
	fUvM+TgQBrGx1cGOERcjzXvDzbyMw5l/A2sNQ4Tz3R1MsxPCBEV8AZSd3BQNkRMP5Hztlq3/Fg7Ag
	GAkwQA6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkhN-00000008Ocu-0xtJ;
	Tue, 10 Mar 2026 00:11:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkhL-00000008OcC-41vv
	for ath12k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=; b=WIMBVsypx5x/rFHElnHoAcaeVH
	aQnZuFE1lEoflZQpDCszao9YcFsUAKgEJot5iD1F6PGCsU6bVlzeeoJgpnQAtEBvofAJp/KXr9Ek2
	cN6GeYC2O/4ItziDtpXYlgHAcc+ZQ8i6cd5bmHGkpA4kd4EtlBduBTNeBtIxAKm2xpM4sn359uny2
	dP0LHvZmfmlFhJ5yi33TQO96IyPGMVD1/NgjMoelBfP4OHCVqleP9sjFy/Fy7eBaqVqfN+zXRAneE
	/VAMZ/GcehAzXpqisGef15kJaRmABs2k6nEsTqzEwOIqUa9iWwYr8G30ySCtYYUbBnvlll8nz7O0A
	otyjRqtw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkhD-0000000DOYw-0APL
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 00:11:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBkLe859602
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pkr/1ETbWQejqwBM4qtLfTAa
	AxiiLLi9EmI3z7gEzag=; b=WqxwLbmWApf+MP0scmsGweu9kRuuQzlAxKa4xDS0
	me8bCEsYRkKs0UqWwp4R59vPcDuVB+sUvSjJYiktF0Pg+GoksF/Yb9wLMbKTsSy6
	eEvNwkXDKNb2s5O8Q9n7PJaB1PwXlA41ErXyFErlqYexgIloTKVfQBgaWmjJG5qY
	vZkjvoz4Gc9Hw2a0R2lMbYCxaWXF0jiwiNDghAdbIFS/l/57J33Cfq5PJC0QFLDz
	V83A0oMU9E0jnBSSPOM7pcI20Df55lyB4rTvvcc/Le0Q7hATER62nsGQGoDz1Ql6
	a6NqXFKxHRyQRVayozXJPrejWDjiCtYw3AzN/Slg69jV0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbstrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:11:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd409so310447685a.1
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101492; x=1773706292; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=;
        b=TN0vou4aWqLcH7GfPXZt7XMbLB2mVqCWMXqW5JkiCDuoUzgxbxNe/kieTS/EqpFfFA
         7VYvqmD1JS1uNL8uEloA0oNcyS2VmhJa+ongPZU2BUTReG5xHA7HYpzdFs/6G1r/ILNa
         n/Mdw6z6VVY/YFpOiYrV5hXzYMaA3yubQUhPSHum/mWdPpgRquQaz5y//eqGQNLzsoFZ
         9tCA0OCPBSvr6oAu1iHMSI8V1HIlJPxkR1w2zagMTdPxSGI3DNZwLSpC+VkbWZqf65Hf
         AhKglIt+CiWixHoSsQbnAncYFCo+tv+iAM4q37kD4/ED9+GJ81NLZZeLVWpS8G6rF8qE
         uoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101492; x=1773706292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pkr/1ETbWQejqwBM4qtLfTAaAxiiLLi9EmI3z7gEzag=;
        b=rUv6BI6DdcEj7w8CydBvUssIWRAXnG9dtpKmHwwJK6X4tOJV7NVc9kt5GBFSEZguxD
         3UnOqoPfpIsu5hYtf79j+vEFVmeTSEftvCuPtepgNNkmBeWeSX++J8IpVLKWgR5Qa8wY
         9yiZjytNJC80IN1VvAZt5rr/XOarbeoRppUcAuNGyu9H7cZFhpsO7TpeSzdp635/qX6A
         v8g5g1SM8Je/geC7jz8GRDj7fvmb7//L0C++AVHNhPNRoyvUWOp5JKDfbS536LfYlx5q
         N3XmPmjqOxfhrQfF9PTIHrw4aJCK0NWbD+pfdjuL8fL0g7QEKn6AMBmHkynHGIKJFSc1
         dvRg==
X-Forwarded-Encrypted: i=1; AJvYcCVmK0hFot9/VBjZWkK1slVp3RXlJMwJCW+1Q42HI3eeTNRM5U+c3Y21XmOJpuqul/SV7Z3MDAg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0FS0lX5wIy3GZ5WfYoDNadvgNnMijhc5ENEKyFgiUtybWgbdj
	BiIYCiZDYHzMS3DwXWZWV8i9iwpDHhWfOoagsDvJaRSP8BEhw7fdEfA9iEwNrhy3z+KJjiOb4P7
	ERL9KH7fbRwgMRjZJyxPd7Odj/g5uc70NvrVO5kjnY9l4o7ZLIy3/BvydegV4BSom
X-Gm-Gg: ATEYQzybM9GgUxMLsW3C7p0tyGXbqQ8md1lNisNegIfxRCQr3gz/pFcLnryvWMSgTIb
	UenEW8kqAUjdWMnwBzIVlZ/YGZkO19v/gGYZUE/gOsJwlBJx4jatBFEjueVs4RX6EXEEouw0QF/
	atsERdqV9lLdSH+cLQE8Hw8Q+LY+7XFqY9kTdxkguNZixkIiZaVSdwKdG0zBf7dCsnFGxl//ENu
	bYF0sSJgocOz2El3P4ZAZ/DIgqmdZJwc6rn51mF+aos1141ukSSO96d27CIVy4JD8fswSmkZQx6
	0xxvUx4Jjt0R8gCRIINdsey/QTl2ozMZKVOP7aVtF40AhOw3U1DmO9zmamrLvIDdjBMeOlbsL3w
	OmHKkhFoeBfNGLnbyF4798rzOf0q2WShBHgM0aKr9+A/XbOqqxi30bT/tIh+6F9Jz1D6VY6qv7b
	kCTFSMyB2kOA5iGotmbehXqTmcOqdqfgLym4c=
X-Received: by 2002:a05:620a:4445:b0:8cd:8635:c031 with SMTP id af79cd13be357-8cd8635c4e0mr698515485a.20.1773101492235;
        Mon, 09 Mar 2026 17:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:8cd:8635:c031 with SMTP id af79cd13be357-8cd8635c4e0mr698510485a.20.1773101491691;
        Mon, 09 Mar 2026 17:11:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfcb1d5sm1692581fa.16.2026.03.09.17.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:11:29 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:11:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
Message-ID: <ce5hwbo75dr4e7tt27bcprhpch6fx47omhn22ni6v3uzwfb2f2@fa2bebk7foct>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af61b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pNJNIoqo8oUBudG6fy8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX3im7d5bNlNLU
 4yLgpd21ynAWSLkCU8rZJ43b0J8ekwwJtLJG2p2mcQ1Noa3IOTGoTWCzRJ218H6sRxtgCo8UwQ/
 0IU+KjAMHyNHVOIso/CqcEacsJLYwC12vDzIEgZCJhMnU3i4o41o7qed1f9vmE5ocMeujExgUDy
 a0SPhFpz03UpFMekC5AgTE8uxmWHQv6DAEHHDeGnmw/12mvRg7Yxaa9h3GnPPb22ABNE7Z16ibU
 bcUc/R6ePr4rUVZBFJGZ4nqEVFNJ3a6JOe2nzi6hfR6gdOrTxjPamdHZ/uXU1fk9UwbpaX6OhdF
 UNl0bC4cildQRjYl23Xi8l8yL02YEPz4kC9DCCuaWyRGBdg89+MzCTCABdA23QlWfhurv8tpCSF
 pY5QSjdn+/cL+DkG8qGtB9HS3SxrwMB7Oqkl/y/26DTtqtk3xuo2huA1YnVtKyn/fXVLWpbrv+J
 debJfwRN0ouxWqGPQUA==
X-Proofpoint-GUID: fwxzR823ORVqr3sRrabeaog1bUAiEHTF
X-Proofpoint-ORIG-GUID: fwxzR823ORVqr3sRrabeaog1bUAiEHTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_001139_119081_0FF6E5BE 
X-CRM114-Status: GOOD (  16.67  )
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

On Tue, Mar 10, 2026 at 12:03:29AM +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> It makes more sense to unify their names and move the definitions in
> the QMI header file providing a consistent way to represent the
> supported protocols. Consequently the different drivers will use them
> instead of their own definition of the service id.

Also this looks like a first step towards providing qrtr service debugfs
in the kernel.

> 

-- 
With best wishes
Dmitry

