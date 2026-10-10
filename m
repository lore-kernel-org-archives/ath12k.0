Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A2BCA9EBE
	for <ath12k@archiver.kernel.org>; Sat, 10 Oct 2026 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcsVVrQTy9+oPzMIs3wmnifLrbzfhME2W7FHzOhUhMw=; b=WY8IncgXRfExQKfeZKb5Rzmdki
	nfn3/k2rakO9OZpmBYyb0tf2TPibXvkGc5c5y5dRKoXd3RXgbfazEuUs5OEKI2zj+Uw3ztakL2LU8
	ybWDH9nTZ/0FMpWM5YlRBmyoDv2jqjdije7sNM/5hb1LvCH6e9gNWsbCzwF1wZAx8FrXHji1zrNvg
	D2mbG1HUXEd6hvnc7Og0C9zF8+CQdxujcWjRF2anQXKd8JH5+TSI7wF8RgZRTo5WiDy7fVxZrjL5R
	jwtqKwpDHPzy4KMu1C9q1gCzkOwYZuaNnGTXxhghLwlDSSfLD44o5y2KZS8ClygTihbfZTKwBXnpE
	n3PE9GPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFYNU-00000008Bmh-26fr;
	Sat, 10 Oct 2026 14:48:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFYNS-00000008Blb-0GqG
	for ath12k@lists.infradead.org;
	Sat, 10 Oct 2026 14:48:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACVJaM1021591
	for <ath12k@lists.infradead.org>; Sat, 10 Oct 2026 14:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcsVVrQTy9+oPzMIs3wmnifLrbzfhME2W7FHzOhUhMw=; b=OyRdPm+y16ElOoNT
	YxVLDNn0CxeULMGVfzgONvVKk2MwRS1h18xKrUH9dQ7FkhnM90G+7fJShgMNDFuV
	inbFcytPbprA+Wzo5ZtG6NqoVz+B2SCq4wNk8aSirz7Kox15AJE9UtYMiwYTpMLo
	MwE2qae9kHPUp0BxnzcDIJ0A8uGyABTXdDC3BmSYuahtoWB/4nxjkhJvTlYhYQvv
	04LOayrENCzXSNvn/MX4uEPbZolfZXKLxWD0LYeAjxkq8XyqmoveUaAIEaFBl6GA
	7YQ95QF5WMpEEMmHbqh02du0EVKN242IteSvkVXu/1hT3BdVtshltHkvaWlYqMgT
	5B8Mcg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cc69c47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 10 Oct 2026 14:48:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34e676375d9so794269eec.0
        for <ath12k@lists.infradead.org>; Sat, 10 Oct 2026 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791643723; x=1792248523; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcsVVrQTy9+oPzMIs3wmnifLrbzfhME2W7FHzOhUhMw=;
        b=Ijo2AMTir2wKOrjC7dVALPRnUrjqhGQprhaUV+v/KJ/BEN7HVEES0DB6IBcl0ymbjR
         uAyM4DcyughIEKWgaakgd5/VbN79lzf9+rP8mjJlLjMvkVg/blq7Ym7MYF+E5kIXnz+Y
         VF5sTB8BDI1O6ZnBpuzVogvJM2ly9oFKAnmI/qFFBk+3aervPE1fH+06c7Nnj6MvT55M
         DCAWeUdgtD5E5/ZyIqr7tyz34XNN2jJ//rQijoF6fkOr3wzxQu+9c0VYz3UKgq6UviSZ
         tYHJVg4G9flYae2/Y2GNYMpYtVov6rvMposhTd2UmNGN+9axbh2NEi5wG1OzrByjurHQ
         0Eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643723; x=1792248523;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcsVVrQTy9+oPzMIs3wmnifLrbzfhME2W7FHzOhUhMw=;
        b=lVTfB8CjY7OWqisfMvundsxqjfZ1n6wMCGCgM/mx46O6km4Ke4adD/8xp3hA9RyAKr
         bMC5OWimYDJmOWF6Vd7i/LdBWWZpzvxVJyc9UqQtE0OqWy4QeW7jWSHaacBoDMnv5jOw
         zNy6S+Swi/TFDR7m1+O4p/n2y+KnCEkH7GLDgBlrple2xRkzKvMN/RkYJcRpZp9VHV5Q
         RJcofcTkq7chBIeR9ak+LUrWogzsFViA7M4MnQJOKSEDjKV7EBAT5CL8uLJ1Y+BTJotS
         ABYh2Wa+5f9Sv30d5iBr/GvzOdkmEEJP15XAQVyqnX5Z6IHR22M5+L5T4QvYeOU5aO5o
         LHUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8rUIUuBsqvfz5dzMCOq7Ns2UuHa+Zo1b6bqxUT/P7VF+h5sgJPPuWQQNFx/gN3ugbrXpIYGg=@lists.infradead.org
X-Gm-Message-State: AFq9FYK9nh5IRAD7afbtnpF2ce31XfvA1pAYU8UY+Uw3pfRugYsSGFi2
	/ap2tPZvQhCKVGt0rJzWa1XfFRQFi6aFC+3Xzmw6Hs2o8/rQrmIWrfXYuTOh0+pZb9/Y0XsPt1X
	ffwH0+Dg4N7GEEjdDsGa/+CYKBZQxTTBrPO8IVcpGrpGa0ti4i6ppuqaw71UiAWrjpo0cM2q6
X-Gm-Gg: AYBFou2Obr+xDCWm+NePj1Ijvqj0qbRgKPqGxYwIfGwV1B3ZXaJcWQVS7qb6z3omvzu
	dEac/4Dk/igCInSORuWKlHd0da5cnbmz5FtQh6Ex+nai0nYvFxYgYKZRwFccNR7Sj6bqQlvnmkh
	lsiux8zDiNbtVaOmorUu+V9MJfPLA0Wfi66EQl6hFBZDb7adY7Y9xo1HMk05v/TeUXidCrsBrAc
	24ipUQsug+lWvyMH+IyA4GVQAciyLSjIv7ilpUOcgQqnhxGUtYQiV1+sxcfhlUkIVN08576lau3
	Np8KdIXXfxfml6LphTkuQR9J8Ot8KxN4Km+0QMYHGua2hziSNv3wN4akAa0y9eOy0BhN0lpktr7
	92JrPvyNnnbtDAmaGx+73ADUTh2fy6tFiKzqbMGOGp5QMuWq7BkxaqA==
X-Received: by 2002:a05:693c:821a:b0:357:ee3a:267a with SMTP id 5a478bee46e88-357ee3a2dd9mr3597875eec.2.1791643723156;
        Sat, 10 Oct 2026 07:48:43 -0700 (PDT)
X-Received: by 2002:a05:693c:821a:b0:357:ee3a:267a with SMTP id 5a478bee46e88-357ee3a2dd9mr3597828eec.2.1791643722385;
        Sat, 10 Oct 2026 07:48:42 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm19713287eec.14.2026.10.10.07.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:48:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
In-Reply-To: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Configure RXDMA buffer ring
 size per memory profile
Message-Id: <179164372163.2359474.12323997868750930117.b4-ty@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 07:48:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: HyYGkvmclZ7U6-dFgGyQrpl5iEYR0Av-
X-Authority-Analysis: v=2.4 cv=XdQcX455 c=1 sm=1 tr=0 ts=6aca504c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=O8DM5gnZE03VXxh4g-wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1OCBTYWx0ZWRfX4uuTj79rJoI/
 et8Pdu+FsWnwkOcILyhqWu76BhracG39ZXXKv+WlMYawM5ULbkXnLaNZ9at+b/bPH8Ft+Q2vXPQ
 xcnNYAYOoE0j+SpSDQRXK45kZ7772z4p3aOkp0sAR3h4XNw00erGXU0AoYz7VtA+XSNGwHPSfZq
 QbTaaIp52FSWyQ68i6NCbaPDyuDWe6+wu0w4lycI+NbBUZWpgZXtkcCeAWY4A7nWxtxsEfu71ZT
 H5EOoTXyx9lRqxuKT+sz5BEVXddoPjW3J5ZS46nyVijrDWFc14jVvxp0gHndgi9qnqPdPtNSy/W
 oyp7xplmGmUTcNNtA8hczxzolCuBezg9zAvM1GKeRVgNXZpttFkFVhGC/KQbDjavWCZRAbbbstd
 t4aTJsCaPjNwt6rZ3ZfgDG7s/8zDDj12gqe5eHg/0C8YeLnRyW7Hd8/NP8g1FUFefEWxt8BO2bw
 +vhfKiLtnsE5HmMSM9g==
X-Proofpoint-ORIG-GUID: HyYGkvmclZ7U6-dFgGyQrpl5iEYR0Av-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1OCBTYWx0ZWRfX9xDzUZYMJYJd
 /HmoFKZ4v2oNjziTNFSWVtvS+KcPzhL4KZOe2qTHYHXgCVGcrnm9pY+HDht2dZf+fV6irKo8ppU
 m4UbM4ye0Gs/4LcRf0tilGgX6lbyRmc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_074846_220970_93F86495 
X-CRM114-Status: UNSURE (   9.29  )
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


On Wed, 07 Oct 2026 14:53:31 +0530, Aaradhana Sahu wrote:
> The RXDMA buffer ring size is currently hardcoded and shared across all
> memory profiles. This makes it difficult to tune the ring size based on
> the requirements of individual profiles.
> 
> This series first makes the RXDMA buffer ring size configurable through
> the memory profile configuration and then increases the ring size for
> the default profile to improve RX traffic handling.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Make RXDMA buffer ring size configurable per memory profile
      commit: 643f0bf936176c114d5631da7547e991b5d99f10
[2/2] wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
      commit: 15f7603b69a83a0acc7fcc8992ecbea6110f9424

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


