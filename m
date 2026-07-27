Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E2BC531D0
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdBQPrjwPQsdDUmRMTsaOQd2S4oN7+S1ppeJTDbsgaQ=; b=Dr2c6edhqFOUS+jRWCBamzZm/d
	15+eEvZhrL6gzOyQXIi5nMbiP7Uizqd5klEs4BmuPDQJr6LbvAm5E4X437mBUYD1oyAoAwwA8ROjE
	IqFD4PD0iFcDOIj1/UDqF/AXGKhRUODIqc81sfHokmb15fpOm76gaev1SOsH7yD3iPjeh7Nqoo3zA
	z3Pn6R3VtCj236hXT5vLmRem4od5jkvGzHzapVNehhyQaTrU/HTiJAWCWZdwSjqn8c32zk7HHJ1Vz
	SRgoG02tVcYGLODv7Sc/98rnhSP8wZoAydgNxQIrnLgMq3ubSQ6YzNgON6d8InOohszQihTkf1Rl+
	B9PfuvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMr0-000000037Qo-2JOf;
	Mon, 27 Jul 2026 15:02:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMqy-000000037Pn-2HgJ
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 15:02:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDldje3414105
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 15:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdBQPrjwPQsdDUmRMTsaOQd2S4oN7+S1ppeJTDbsgaQ=; b=DRjdqZQsAaeBv3Ss
	4gLL3q6RuSip80ZoGlJ7/L9FBjDQzU1ngkkmb7RXJKGgTC5gFOuYRQLbpfuzjkF/
	cEXH6Fm6q3SmSnJlvwPRdEGYVEBO1Ck8TbMVx368Vw5P1wF+cLwJ6w0afVI7t/do
	qmFB+OF0vatW5ZMyoytcb8F+qSIJCn6tQapxL1ZLiqDjSl99hg5p7+4IykXlzbqp
	s7XOz5VxxyYl25FsejMGrZbyEjg5rlsZToveq3obSNELRVaGcKLHTr9V9T+ejbGH
	DYTlIxSTCHiB2VGNNyMK5h7EUqNi/b/Sj5huPcQw9K1RfojSROdJrNUFNzwXwDpX
	AoEk7A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v6985b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 15:02:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1765367a12.3
        for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 08:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164571; x=1785769371; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdBQPrjwPQsdDUmRMTsaOQd2S4oN7+S1ppeJTDbsgaQ=;
        b=Drq81C5QEl7ODzXkajIDeuv3r1obtqmHHtvdHIzCyr8KOknHa25H3egy2qB+C13R/d
         RR5qtHbHV2HEK++dU1qWyU0RPpQC2RS4KKA3bZZaL6Kr8YyNQOCmDzPNHeb9wwZUN8VC
         t2lD9qER/rIkGu4+UeHVtzqjPcSSbvrMs/UxSqsKjsRgkDgzVMDn6WxuoNe5dCqiiFaa
         tewdU9zQjfQNi+gVVkXjiuV3svS569tXx/RBNmXNqG/F9b66A23wO2mZNNiVBEGhxa2c
         OaLkG0S/Utok/wWYymvsTI9sNqClpAy+mSSFoWxOD7vELbF95tQVEivOZy7JO4cPvzUj
         p76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164571; x=1785769371;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdBQPrjwPQsdDUmRMTsaOQd2S4oN7+S1ppeJTDbsgaQ=;
        b=fCmTx6Ul6aCliiEp3Ywx8FzKqT+cMMIHiY6hf71lFAwo3NIW5sCAliC0jpcDAcdGyh
         7ExCgbdWB6cDXeXxMDvVixLrmM6jadlLEWAmkRDRf1kdgrigCmpMeCOouut8ouMzVjKL
         GQBy3tm7HZqK5klIIz6I06MnZNOVvD+vM+C+cMGUcXryQIE8/W+aMyfmy7KEkPh4ss6z
         eBHHgdyuK9vMyvMA7erneo+onfVCwCKa8t3l1DbgK/1NNWuktDfuTya65RpjAoFuu96p
         SmY3PYyhj6UR699T6JXSCnPLcZzpoBnr4tKLtiN85gClRPLcUoUJMUwBb7euAqHjUsPZ
         cgOw==
X-Forwarded-Encrypted: i=1; AHgh+RqCmvVY2ecMdOqmstv7CfkvveUaDNfRf1HmbguHuAmtgAsXaYjtmw1OxRvGycv328uN4TCXgVQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZKDraig3V0o4i0CqADPVY1dbS81ze18hxxd+o7yGDckmFQ6Lg
	4M+4KKLmrd2knPMB2gU18HN//xCWEq/e6qXJQ0/hHvyHV8cgc5n8Ub3GnRQtf4MwxWMCD0eIOCk
	zXr4b7wgc3tpsTdkWmAWLv2S82BoM65OyJgBMxqulmnHMwhpvBLk7Cq5M8itP5Tkh
X-Gm-Gg: AR+sD12wl9FqgqtOuLtmtUna5FGe+BdZnrpr8Leap2ygC3Hz0VaKrsPhpRqioncfkAI
	i3gQ++mhO65/QG0y0cfXE2Na1MeaRdEYtOKuhQIphmgDgnLWjUfI2NJ/puf5eaBnuFYIuO+zrTu
	CziCyZrO2k31K6y/gnRyHQgiFJ1E5CKegd2sv/exphXpw2cTNd1fpPp1JiBbu2KR5+UKosL/qf4
	TvbEcLk9lV4ElDxrDlSFGljUxrCdnhJtJMHOJ0ZcHg6D9XrZfGna9DQb80Sqdbb/XNoxYGSy+bQ
	5anw3zDDFH5pnPrcmEx0cGfzCrWBp14cV2JDQS3gtbbmYvKiOkD+M3OVrMvrjst7KgEzdfVIxbp
	Ne7utqq2v6od8wznQoUw+XuyW2IWWxBfz1ZoK6G1F96VcTefHiRkzTdA=
X-Received: by 2002:a05:6a20:d4c:b0:3b2:924c:566e with SMTP id adf61e73a8af0-3c67ddeb79emr7974000637.36.1785164571143;
        Mon, 27 Jul 2026 08:02:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:d4c:b0:3b2:924c:566e with SMTP id adf61e73a8af0-3c67ddeb79emr7973957637.36.1785164570537;
        Mon, 27 Jul 2026 08:02:50 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm48099150eec.25.2026.07.27.08.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:02:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
Subject: Re: [PATCH ath-current v2 0/8] wifi: ath12k: support
 firmware-allocated MLD peer ID
Message-Id: <178516456886.365144.13053000495795767210.b4-ty@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 08:02:48 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MSBTYWx0ZWRfX6XAgHxgh9EO+
 aecHjRg8BHncZsleXZKovi7pFRcxx6Tn/7d1mRgjrGCHVJ1d4xHz/O+MXPp6QKY2WLwclLZIFZs
 RsNddKnhSo51A8r+3pvI+h7p58OC3gU=
X-Proofpoint-GUID: bHZ12QCQ9k0pVcUqMORzvuKWdMu2C6Cp
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a67731b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Oofje5pS8FeG0v4RG8MA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: bHZ12QCQ9k0pVcUqMORzvuKWdMu2C6Cp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MSBTYWx0ZWRfXweyYA5M+A809
 Wu+VlSL2ZuZFZCzt7siQejEdok1HjHPoG7aSwCgdeeJv5iwCtprDXxaY9vlhNI90XYGOZJ/IdLp
 Oi5OQqJsqE8z0RZm5Inx0QFbDLO0JeT+099XIh+IHCdAZPxItOwy7sbPOzbRHtchGCgCGS9ExjU
 EQhSN/X1JhBvz00/S1JMradg+p4paaGRjt8v3vCIcWYapJz60GpNFyY6KINRk3V0496vJY1ewqt
 5+5v41Gl4KqE7S2w6Us60d52MeSZ4a2LWZWSzLmD7SXg4TMRlj6WfimcsTjQPWqwQRUakhNu/5u
 clvBs7w/LE8xfB8NVvt9Fo7ZYD2OnRGg59ReUAFqZNRMeaFs3I9e1fsu+lJ5CLBNGoc59Cjakx6
 o0R7fQRqPs2vN1e0aI1YMsBUmzabZYf64wklmFfDws37tyRNq9lACaA47y7xH3L8wwFAVS9Jmtd
 8iZ1DnxqSdxksnYCEXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_080252_597197_00B866B3 
X-CRM114-Status: GOOD (  10.34  )
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


On Mon, 20 Jul 2026 14:43:21 +0800, Baochen Qiang wrote:
> ath12k currently assumes the host allocates the MLD peer ID and passes
> it down to firmware via WMI_PEER_ASSOC_CMDID. This works on QCN9274
> but breaks WCN7850/QCC2072, whose firmware always picks the ID itself
> and reports it back through HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP. As a
> result dp_hw->dp_peers[] is never populated for MLO peers and the data
> path lookup fails. On QCC2072 the firmware additionally crashes on MLO
> disconnect when ATH12K_WMI_FLAG_MLO_PEER_ID_VALID was set in the peer
> assoc command.
> 
> [...]

Applied, thanks!

[1/8] wifi: ath12k: fix out-of-bounds clear_bit in ath12k_mac_dp_peer_cleanup()
      commit: 47abd2ca281531deee38a3b3770d885e270e9fc9
[2/8] wifi: ath12k: factor out peer assoc send-and-wait into a helper
      commit: 21ca38bb6b53a0b610998f370a91e656dc9e0542
[3/8] wifi: ath12k: keep ATH12K_PEER_ML_ID_VALID set in ath12k_sta::ml_peer_id
      commit: dd121ed779dd62c7679815f7c5a0b07da60a39bf
[4/8] wifi: ath12k: add support for HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
      commit: a08455ee85a2b32a5503b84fdc6b88a144cb2388
[5/8] wifi: ath12k: introduce host_alloc_ml_id hardware parameter
      commit: 378e659029d55cf57ee2eddf1d67672ed53c3bb4
[6/8] wifi: ath12k: do not advertise MLD peer ID for firmware-allocate devices
      commit: 1726a7a10c4fee262549bc6fa142e1051192be0c
[7/8] wifi: ath12k: defer dp_peer registration when firmware allocates MLD peer ID
      commit: a7619b3bcba42be62b3b4b941d4175234dce34f0
[8/8] wifi: ath12k: resolve PENDING ML peer ID from MLO_PEER_MAP HTT event
      commit: 469d7e6077c1665754eaf330e1feabdca7b060ae

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


