Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1189CD6E55
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 17:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtbUhVE2fF9TX3S4/PmYqoTy7RsjwKNqXyyUYeZKwMs=; b=bzhYdPTpx7umcuQtB7d2h0I8UE
	NA9OWgY036SHuAekCyFh+q3xp31pwhf246a0mCkH/Vek5nbBxz/eQ3/qbnbpbDeXfciTcZLW4YBz2
	7pMY43dSLgxVLxK56amvde7atMuxoVMWPGWB7JbNOyikJgkD5q1VQ5PDiUi5LQT0DVtkGU9Ldgdax
	bvCWPY+wNjrU+JKCmLE5h7IxJrWZFpHOBuhFGft1herMmTDHR1AC1Ozjfd1chDuBgtcija8BjZA7M
	RhiaHOYNg/YevWaWfzKlT9aWljIuofZDr8WfHaNMKRkBwznSJ5dqmQ/5b8KH6Vosfq9Vh/TMqkaC1
	PtOq/usQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60D-0000000BWws-09xg;
	Mon, 01 Jun 2026 17:00:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60A-0000000BWvN-2sxl
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 17:00:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FuxFR3372774
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 17:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QtbUhVE2fF9TX3S4/PmYqoTy7RsjwKNqXyyUYeZKwMs=; b=P8Z4ilxmNg9bZsQW
	1/BFWl+IkOead/nJmEdv1g4cdSEa7zK2/xWK8ka/bCnaf2oyBfyCAgFRPj5XiNwu
	I6tP11mTVMqCtZidZw2QzgGOr8XAEZ/Qmm0M2SN65Adyr41m/9OSB5oANEaN5b1H
	2c+qgLvWa+SKZI+oz0459fNpfTbGVHU7FFQelw01Jy5VSI1WZ7AzpipH+gkFBbuZ
	TEnF4sSqH9aQODDt5y9HGOKbVo1/itg/6jpfJVU2XMNFDb8ykwKzvhZ/vrRQZqON
	ZN21Xb0L9RQlEuJBqlfvvocLc/Mnqsm6tIAhEy5cAZxpYyaYDGYElAIQh74PKArJ
	OyVFZg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh9vee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 17:00:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304c652be4eso3395015eec.1
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 10:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780333234; x=1780938034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QtbUhVE2fF9TX3S4/PmYqoTy7RsjwKNqXyyUYeZKwMs=;
        b=JreGKfNVEnKAQwPzSyDSLn3XtwRX1Uxp7w5ztNq+Ne9hPKlKBY6c5EyhAaPvY67LqJ
         whWSppVDMAIjOjLYodZW3lZkS6zOEFRkEVYdGHZWM7Uw5zFnJgGSnNkwKJUOonj3+FFr
         jxR0txvhqegcfj6i3wXz4O9XitzBdiCF++MMLNLL0Q0c7QR4bl+XD6gihIOnYoAh9FTB
         z9/JDkd5WXAyb8OKnSRE5Oi4JH9yL4Xb+GLHh2zHAzC1AiS+ctyIPJ3c6rmkHlwXoubP
         CShGBwyKMAWZirkuz7bwGzSPX3uq42hFE6ktCWAdqKAkn/kXGyA6LPshCeEBY6FkEVKO
         qpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333234; x=1780938034;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QtbUhVE2fF9TX3S4/PmYqoTy7RsjwKNqXyyUYeZKwMs=;
        b=UTcjobStnzSQ8vnJfKg/tfrfXRhKSTLdJk6vlIFVCztK5jlBeBtjDXsz4BRmypJBdV
         0i7fV5REc7XQSnaxX+QaGR87elXRTDuXdA1PJwFuRWg9K4dLyASKuYgyt5zJ7WNW9Z75
         omff093/8vJq7+lTSjPEWbidIHNBBXczOeqER72QhGtsl11knhDJ8j9saOjbsZkDrTki
         zia6GbI13YwZAFib5SmN0QvXIdhflVEdWU1piAeMwm3uLP8c+HPuizSFUdjqj5HQNyxa
         5N5/a4eegPruIeHNbUNwssmrqTTxNjkj+CrbhCHb6txRcbq9VtLrWH1mVKvh2yVqXVXy
         Wx/g==
X-Gm-Message-State: AOJu0YyrtBOAoxzCxB/RJ1vbbFZ5JjRVB1z4gmqwHyTDRXXkEFTPFTdg
	5gemiFIKjItrlIR0EvEVNdqUlX4OhWAm/cgOIqJXx8dDqbhPvYXgpqcHCKLhrgGnD3WAzeVwqA7
	JgJjksAnOlsVtxLlgRnxP1PGidIRp5kpywImDMbsQGmtbJGLFJB5Ju9+XBYrd0WYc
X-Gm-Gg: Acq92OHW/fGlp3gLrJioO2kfUnIPgL28xgwh10j517EH3XPqdgPhor7zHCu7Nzev18h
	Y0wU1JNWBq3OhEFYSh9DtTn9v7XWkWFpnJxqssT3drcr/hJuMChu1A7tSBhDM18MGnVJdzyQK1x
	61nTwNjVx8fp7PZ1fw7KI5iORHPmn1KUI/v2/+Dv73He/e7Gam3MmvgjW7wjxcJLHyuW/aW5qpF
	lVkPsxuYKbFj+lcsIvg2gA1xkqJB6ZbTTJ/1tAxD0Iflaoaajn+AjotiswmBt+3iFwPUfjY6oNJ
	3h1ZvBAVQVsQ4vFQv5j1wMdaAv5/UoJs5x22Xvkl6n7/Y1FPcDak2/m6Di1oRhGND7IvD6mfSdi
	3vNpe895KdtIXMIC24hy42Bs+qIFKadEdBjkNax6o2DDq2vFhVp2YhLYH4mG6zhvKqeMw6PV65F
	PfJ43dqB+z+Q0=
X-Received: by 2002:a05:7022:f9e:b0:12c:15ce:a71b with SMTP id a92af1059eb24-137ee342a69mr115603c88.25.1780333233551;
        Mon, 01 Jun 2026 10:00:33 -0700 (PDT)
X-Received: by 2002:a05:7022:f9e:b0:12c:15ce:a71b with SMTP id a92af1059eb24-137ee342a69mr115574c88.25.1780333232808;
        Mon, 01 Jun 2026 10:00:32 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm7151625c88.9.2026.06.01.10.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:00:31 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        kwan1996 <laicheehou9@gmail.com>
In-Reply-To: <20260507015336.14636-1-laicheehou9@gmail.com>
References: <20260507015336.14636-1-laicheehou9@gmail.com>
Subject: Re: [PATCH v3] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS
 reporting in monitor mode
Message-Id: <178033323119.2045173.16227438504007191011.b4-ty@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 10:00:31 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: iKWmjLjLgETadpfKlYU_iVDey_ERUn3X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OCBTYWx0ZWRfXzBm1MDu+Sb94
 Mi4npm79EAwE1u9SwLzBsTYifgJoLhdhwo1+H2DiEcli9HGIFD563H3kVoYXhuFPMHEIZFpQEYN
 di9SKq2cw3v/PXKRgEYjjS9KahOec/wIO2xTkzUR6TOvtiHOU1AMKhjBKhajKg3MbAs0CR+UaJD
 HuY4xX/zjsKWBECT6MhckYEZhOhLweGBVbdFP0WNb3S88cNj9TVMPU5vpxOD+r9G/0ctuEv5g+2
 N3GMTaLXuMUIwWLJUBSsiKNoyAzcLeuUrkcFdEU352rSzTEHORaI1vHu/GkYuZu74b2kn42HKZo
 1qq4oWb7G0icVEwn+pXho1dEVuUWvRsjWmmqoqn/r6nEjau4eUtLAPF5AcaOa+BH1+Or8Gt+RfS
 DXW/jaoZO7nTKM/Y6bJKh+CTSmJCHrVt+e8E4CQL+YjuGdBUWfS91WtmOlpoF2BrcHlzGMq2gLC
 d+aZEURdZiKd6t/TWgQ==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1dbab2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AD-vRsM93oxmN9sNzJUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: iKWmjLjLgETadpfKlYU_iVDey_ERUn3X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100034_767376_A8D706EC 
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


On Thu, 07 May 2026 09:53:35 +0800, kwan1996 wrote:
> In monitor mode, the driver incorrectly assigns the legacy rate
> to the rate_idx field of the radiotap header for HT/VHT/HE/EHT
> frames, ignoring the actual MCS value parsed from the hardware.
> 
> This causes packet analyzers (like Wireshark) to display incorrect
> MCS values (e.g., legacy base rates instead of the true MCS).
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS reporting in monitor mode
      commit: 10085a654a4c2331d5f0cdc20bfc839a49fbb886

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


