Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A7606A319
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 02:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J72gK2Ha;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Te9rgS+b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bie+uF3/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t3/8p3pFjwueYne/Fh+jqF50g48cn2FBQc5K0PETrMw=; b=J72gK2HaAgHA6GnZw9e5bnTxaX
	NRmAp9ILDXVpEHZdin2VTe5o8i/Trb6NvekT+SeEdOZZ5FdZy91LgjOkDDQYBD0kJwb4o1Gh+iLKU
	SoJtJ+MqchA9DwDMxFawez1M37gh4nTxvFc5P3O7jB+p+cJqzEwGrkIdxDbSCJFxYk5gClYMhb8m+
	EdeYnGsDqwPx3YPuNJOOf+VlasB+y/Dk3VpPlQATNGDEgywxuVHyZQGXu9qBbSJ75gaYtz5DcvORJ
	05gTmL7o7zwPQDHKCNEwCrU/Zr/XdMIlZoYCfjvsnMyqtfArq21CjXf6sYgjEK0j/2z3x3NnTzb83
	4pPkAtGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5FZ-0000000FKsy-0Lzd;
	Fri, 23 Oct 2026 02:43:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5FX-0000000FKsR-07G8
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 02:43:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F31U1869061
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 02:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t3/8p3pFjwueYne/Fh+jqF50
	g48cn2FBQc5K0PETrMw=; b=Te9rgS+bv2msXXO/5wYw5VMGaXSbyCBYxYwRNEYX
	LwHCITC9h8OsKfLinfrSSqDOPiM3prbubXt+YUPvYcpl3BDt2GP+WuBVeoQVDByq
	28inHfeyJ32OunSJFdrIR2qyTaOGifx6pepv15QtegFY8t1ocKR6BBSlYEecWbEs
	z+BbZXSys+ZNbyZh9p+i5ehE+tr3tzuIxv2XOz7cR+iUByTWBN4b8n8Asb5sW8d5
	NVmEiph/se58xaYRFZiR8zz3VrSX6uwwBIcKtyqKOVYn+NUvaL3Hg/2x6SVEAND/
	wUlfjy5RrQPmsr/j5/IkAwO58ZUXS2kTLF3k7FKZrYhyeA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmj9jt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 02:43:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so589852eec.0
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 19:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723397; x=1793328197; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t3/8p3pFjwueYne/Fh+jqF50g48cn2FBQc5K0PETrMw=;
        b=Bie+uF3/CUXkQj6AQkrs7fIUMAVyR4hnBEca09Uh8kAX2nhp2/egqvsPTjMZfLdfU5
         INblXP8fKXjuyGpJB2mi8F9j9c/acUIoT6dY17hBHij0S8nuI9J9c3x4/b/cnLI+iUM1
         aT22nm4BiSINHiRs+CVN699E7ljV/h9ZIXryOVrRBccXoWgEC2UgjcvH5HJ6eqGFpSif
         ter7HXIotXgl2PhuHmOWEdFTFpgSeYSjaAayyDiuma2R9o/ppv5cbD2bXPiZfySfzkUU
         HQ4+SgWHy5ovzW3VM4SYZ1vP2lJkAkLJc+/2TgvtP9IvF5u0n/GEifejlaQ98W89n7Ru
         +TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723397; x=1793328197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3/8p3pFjwueYne/Fh+jqF50g48cn2FBQc5K0PETrMw=;
        b=jYZMGoQW9TvgPr5OWSppFXDyO3qdxqPEQaqy5LrNl8jnsYmXPPpeEiKJbx0gdepm7D
         f1F64DAdv75Kt7nEnt0kkZOAD0fdYFTHeNyw9sIlvsCpX/XKVlDYbXBKzikR9ukWPo+b
         xEZOdjXBW56XlvrEqEZgnJhp243eXyCv/+tPX7DHrhBc7j9N1HmSZj8RW9aqqS7MG0d2
         rQF48y1K6gGnnVPOumzKT2WFBn8mcyqyTdCgPsADrs+6FQ8oZZVEymILPi+3pgJrMHCp
         HnYvK/RmbNlzSYCBSCZ9/s2TRInMBLeMl7GDvtJauPpe6J2+kJ3oT0xFMwJH78/oTHyi
         kvuA==
X-Forwarded-Encrypted: i=1; AKwUvBxOLv63+sZUuBMbRrfFD+K/J5MXdqtPbQ1TfXIpN0OF9LoJfqPTtI1ochXSTofQ+CPwGNaLhME=@lists.infradead.org
X-Gm-Message-State: AFq9FYLheLDSC43KCaNOv7HrjujwttnlaNLHVUUI1urlV+DN2+rl9NhV
	k/Dp4Y7CYgLZQVZ2+xWoUlE1lV/xgfwMY1pdsavvCHElDxRgMcmlDbB8E1nezg8DdkLr22RgfX8
	NcOzcGcgT9o6OTvyFs3AgC1QDoWLka+/SF/g5IDnK0kb9MEVtrkiuQ9HVX4s+JQpx
X-Gm-Gg: AYBFou2et6miEuwktq8FNB67ZlUHSHJnH/lrF18E2pHerseUyKWItfcX7rAEpyw9S22
	H4BZULoQYgfkKgg5gvCZZdZgMNVrWbtQFmesFMW2h8Kz/FrkODUItVTnr+q0PZaMu9PFKfRGQmA
	DGsj7RVOG4rLIX8Pu4s+CftgYNZ5euQC30jsZKg5weQ61ABNaWXIbwMvr3EUldpY6eY2gqYvENW
	bQCy3AyAUrPv6ZaNP44wjxK6x5SYzoRfa+wmslgXV2ZrHijXFolWc4EQe6w5756pe6g9g/iw83E
	m5LDZnvoFhpyyqIcghkI3jyTynPkI9C96HBlbAftGsJJ80rb7EDxNA6ZP4cJy0tZOLhfN//cql4
	GLnIZ54LtGD5tP94BUt/YWqvfGwf1vrTEVDesE3QKFA==
X-Received: by 2002:a05:7300:f48b:b0:356:23dd:3c72 with SMTP id 5a478bee46e88-369d964640dmr1148554eec.4.1792723396671;
        Thu, 22 Oct 2026 19:43:16 -0700 (PDT)
X-Received: by 2002:a05:7300:f48b:b0:356:23dd:3c72 with SMTP id 5a478bee46e88-369d964640dmr1148517eec.4.1792723395966;
        Thu, 22 Oct 2026 19:43:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5e9edsm2090503eec.9.2026.10.22.19.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:43:15 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:43:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
 <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
X-Proofpoint-GUID: 8DGJRLa3HALq-TyePk1_hPzwaZ0X4Xd5
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adac9c5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=0oYm2DgIxsn4U9MLWVAA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX16bz/YaAdCiM
 gZasLabaUnLXYvnzqfWcKRnP+xP+SdhOE2DZrVO9GVlt1heGQwk8usAQy/AMryR1Nz2ZDQ2iYY7
 4JkdKFJgilLfi/lTO2tKJuQ2rhJSQj4=
X-Proofpoint-ORIG-GUID: 8DGJRLa3HALq-TyePk1_hPzwaZ0X4Xd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX2qDAb3GwFxdQ
 nYeDueAfBhcrKGJBESRQLjuWfljSSqaXUgOM1jJS6fY5G9dWD4HHZBYS/Nus0VpV+GnFyLbs2e/
 88ScRStfz55I25F1RQh2m9tPOPDRjaJDw0SlR30NT9BYP4sHNSGB/eio5pF5BAt/xONIsv9RIbb
 iP6jebQbvhETKFAykpEpa3yEObhsmO3IEXctM0BNNQpEcMVahZRxVGoc6e7BGWab9UTGqNF2OWV
 qJFzKF0JJV4baoSFRFWUBA6iMsGbhuyKmFU18ZXvui/rgPlhyp8KCvoktpS3ZxPLM31MSP5J/Wu
 9F3v0hKasgpugtCg68ovEL3CShDNR03/O5c2ResmtGuF7FO5ytI7mCXXoygYnQnfkGU/5B/6hvd
 VQ2mST/26RSlFjHRX90lxxOhheM+lo0p1EEQTSXTe824imqhxJmTNOaqq0jQkVV3G9MGrDDE0as
 UEShU6TuW635yGKgwcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_194319_183769_D40CAA75 
X-CRM114-Status: GOOD (  15.97  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
> On 10/22/2026 9:44 PM, Shawn Guo wrote:

[...]

> > I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
> > the ath tag (working). It lands on:
> > 
> >   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
> > 
> > The previous commit, 643f0bf93617, still has 4096 entries and is broken.
> > 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
> > and works.
> 
> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.

Thanks for confirming!

> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
> 
> maybe I should submit a patch mandate this rule.

I'm more concerned about how we would fix the regression for 7.3.x stable
kernel.

Shawn

