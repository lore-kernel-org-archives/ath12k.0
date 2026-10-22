Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D9C606A319
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bz5d5jrN;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LmqOGSLG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wgyz4bEs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NVpZTOS39bJD86GMEOLkvTbG4Abg3hAHRNogiWaaDMY=; b=Bz5d5jrNT0A+sAEjOYIu9UUefI
	PrBj4QEXXBq9H+vlHW7pp9mfQs8d6OcWs+rBwDakKTy6h4bfMOwwsXKdsKgaH78q+uY4Ivas72Kd1
	dAePczzQA1Pc2PdAj+dQixyOQk1DXcgyokajZlUuU+I/43dCne96/73C5ln+ESNwenYKsxcQSUFUy
	t0r3O4hF8BRigOMBJmx7NjKgGYHlfRDuQqBrNp/MDtBacZd86yA4MSdAK3ckUqNP6ATM8S74fyj22
	i9GkeDfM5i2oCRotG6jstYvLM1i3wGUh5mquQmcbeU38fo61numJvExguqgDhtCQurmxBvU+jElpk
	6CQNnXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoyx-0000000DoyR-3TMC;
	Thu, 22 Oct 2026 09:21:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoyv-0000000Doxy-2CdU
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 09:21:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70PuL1998818
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 09:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NVpZTOS39bJD86GMEOLkvTbG
	4Abg3hAHRNogiWaaDMY=; b=LmqOGSLGYOWzGrKYFVtIei8sWtRTw/GT/JAqZbcb
	SjuH/NTEV550ufgxdJ+sanGKyDZvpG3M5CmJ/vxvGNL4REDOY9BVnMraIrJqOk7D
	imS7hFYB1x4b++4/WKhZ6+TRJKLuf1v1fQ03iA6/uL6E6JSHDSyq10mzh3qHMng0
	DCEvz4Tkru+Nm2RTPpYwdjqUVTDgfe7UAexEJh06SzbobnjrXfxM0JErZcxsTmxi
	VpL9HBlKxG3rLgz0XvTHaMKEW4rxcWFWvtvqb3mTDsAUR4IRVtZQFacVtl8MMGR2
	HyHlipI66oUKzsJ6TlqKn27/XYGA0MBeip6Oeivae1xR5A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsmtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 09:21:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so3967529eec.1
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660862; x=1793265662; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVpZTOS39bJD86GMEOLkvTbG4Abg3hAHRNogiWaaDMY=;
        b=Wgyz4bEso05/QaBL1yKLct/pl3y7OyF+mIfxoJsFkrjM+7hn9XOd+Z3CrImwUGxms3
         bXEyCDLnhNFGqjtZxVNQqz8pNV3s1LMukeYg/pJA7yFyaYFxujB0kXyU0W6pYjjuO+Jo
         9jBaOG1Mk/ZOGlwxClK4FsLiOQeoi3sYKk+TnjmZZjEj3R94riBhxRninkc3zjhn/jxp
         oHFrxaNRnaVoHHEqEHkISo0ggCMYGZd0qaoz25/2ydshvbK1vKoNPTKXZ9vR/PkIQTcn
         VnH5niRylpLKyWikcHlsOYMnUh8LVxNkRDRUsGz5vv5TdCcQVb6zQdrLk8QDRJWczYNY
         zJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660862; x=1793265662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVpZTOS39bJD86GMEOLkvTbG4Abg3hAHRNogiWaaDMY=;
        b=FXepBsRCdTBeHHIKbXg7N1x2FL9qA4WjLAUDQqrNblaOcJzZxiDsTxmCwPqLBfdDY3
         aq8lWlRWBhyrenw8BkRE9LPIXPrEQjc4BP7RPxkCyVUy7QP8dhD20HqRs2a8TZdBM2Y9
         6w2z8mV2JZeBbZ8XSbxhMB4hTOo5BWXHzOVVjuXqFElGYJGOs0IFsYhfRy//6Vn1rxjn
         MbgNhVLuOe3rPaVMlrMO/tIHbZPkZJUyoQM45/pFK15ACovb3QmLzfcixDdbSo0My58x
         hv4gAkgCFkZNgEkLAd8Kpx3F4Au5XmA2grUh//9ofWd1YbcXR6ycXfazHXWvmS9Mir3T
         859A==
X-Forwarded-Encrypted: i=1; AKwUvBySOxBQOMVCfdwOHqD7jCgvulOHa7NysUpy3i31aj4gNEvESAZMPZN4FK6Ayhx1oct25ruX+wY=@lists.infradead.org
X-Gm-Message-State: AFq9FYKX3tPyYX/yfwIJqJ4a9iuOH9imlop8463PRXr0UBgqF4lYNJ61
	g8GalTj1y5i5/RnztCs5XejgEvkUSBnG/zAmhK0HuXNYz0b/XnA3NNU7Ipj9rkeWTneUBlvcAma
	aHhU/UYYQU8HBgCBYCL9p2EQqnYNVVRBnkihKlU2pbfpDMydQU2hHR6BxZ/2hvTxzPC3Lr0Pu
X-Gm-Gg: AYBFou1KJaAQwfDfoDRANuV/cnIRiKsU9pw4GE5hEwj63u/D735Vb7+HEJ4gHHWtdff
	zvHGmJ8Uw7yMADhP8tmjTjmlR+JQc8Ar8VsOVaswZvDStn80he5KRXHR7rK7I8qYKOLm5TpBxBs
	hm617UsICdpuIMyDJlEVEN7yrvSpp7OD6oyYc/XKvdxfBLpjGUm3b+wfm2ZAtuB/GRQ0gRgTCVV
	4KfNFgbFKpJ7ZAvTO3wiGl2mo7faL3Z/uzOlKr5JoTXBTD40VeVd+bgrN6+xS54Wxd9sJ/2Zcb8
	vh1DLoBKzrxBIZlEs6EsScS596a7ACbUr/+q93yUS/1H+OkHFO6CZFGZSojwkPHIXpEWwkv9QKA
	AV834F+y1k4r54ZbYZfSPKPEHSLOhk8eaK7D6E9znFw==
X-Received: by 2002:a05:7022:fa9:b0:154:dc96:c1d8 with SMTP id a92af1059eb24-190a03343a9mr7430759c88.2.1792660862386;
        Thu, 22 Oct 2026 02:21:02 -0700 (PDT)
X-Received: by 2002:a05:7022:fa9:b0:154:dc96:c1d8 with SMTP id a92af1059eb24-190a03343a9mr7430729c88.2.1792660861822;
        Thu, 22 Oct 2026 02:21:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm19923167c88.5.2026.10.22.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:21:01 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:20:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
X-Proofpoint-GUID: nPJl-V0Jrw86xYvNWLtaxDrorKWr0_L2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX3dqiaD5iY06r
 sOmQiumlUtJxxO0QDYq83YbmPA9U/gUfi5Ynw3bcscf34A/dLvbakn1BIW8NRLMQOReyh0JaAPs
 51rScfeFMjEO5JsFlEfmNGfY9CvEAMM=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9d57f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=08gsXnlTphqh1DqfKuoA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: nPJl-V0Jrw86xYvNWLtaxDrorKWr0_L2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXxqf0RDo1HRb0
 XfGyqCkFN1mzCOhcdikhJH0fn9e8sDyhmTmjhWC5M36F9r5W93XoBDMf2jTl7dmYUH106mPn3h/
 nH86dkmt+c9I41dbsebk5zSv1tmw3BA2bfXdEov+Ty+Z7BndojK6GllbUc7ll/7yecT6FBjqcxm
 EMonckdG/mAkCv6mnYCxpXjjHe+MkOOcRvD7MNNGisKDgslrrEVfHX5pMLnQK+VOHZlHcBSHcsT
 vDBr92BfsiWIB1jbUtosTmwlbcnFdFnigcA3ehd0C4UeoJ2H5j3/1pfl+q3dEHNWmpAY0jS6lvU
 RDRIH3cPRXYuxyw7hkKb0ogwswGz+GXx2KRlFolWKUhKTAKS6UNyvm/PvIoZ0yaEyJ3mYvQChOh
 PYYo4EKa+yTmh8m+JCb7hDXmkYpRoXrkF1HCKI4VU1SGtzLEaVN7desvgcMPd74CY4yjRSbxl+d
 sNEmz18EnjionkY6mEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_022105_680326_7E22940D 
X-CRM114-Status: GOOD (  31.21  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
> 
> 
> On 10/20/2026 4:53 PM, Shawn Guo wrote:
> > + linux-arm-msm
> > 
> > On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
> >> For WCN7850, MAC buffer ring size is updated to 2048 in
> >> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
> >> to increase peak throughput.
> >>
> >> But during the RX process, a phenomenon can still be observed where
> >> the throughput drops by about 30% from its peak value and then recovers,
> >> and this behavior repeats during RX.
> >>
> >> After increasing MAC buffer ring size to 4096, the data rate drop has
> >> gone.
> >>
> >> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> >>
> >> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> > 
> > FYI, in case someone else runs into this: with this change (merged in
> > v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
> > working with the older firmware that Debian trixie still ships
> > (firmware-atheros 20250410-2):
> > 
> >   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> > 
> > Probe and firmware download succeed, but every WMI command times out
> > once the interface is brought up:
> > 
> >   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
> >   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> >   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
> >   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
> > 
> > Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
> > reverting it on v7.3 brings WiFi back with the old firmware.
> > 
> > Unmodified v7.3 works fine after updating to the current linux-firmware
> > image:
> > 
> >   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> > 
> > On Debian trixie that one is available from trixie-backports
> > (firmware-atheros 20260916-1~bpo13+1).
> > 
> > So nothing needs fixing on the driver side. I'm just leaving this here
> > so that anyone who sees "wmi command ... timeout" on WCN7850 after a
> > kernel upgrade knows to update the firmware first.
> 
> Hi Shawn, thanks for reporting this. I just had a quick test
> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
> (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
> any ath12k warning.
> 
> The firmware images I am using comes from the first commit adding WCN7850 firmware:
> 
> 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
> 
> and the md5 values are:
> 
> linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
> d3750b67b1013fe82358d0538fb131b0  ./amss.bin
> c79c410d585360000c0490f16fda43e2  ./board-2.bin
> 73056f1d2aff886ce9bff313f455e963  ./m3.bin
> d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
> 
> can you share the md5 values of your images?

Hi Baochen,

Here are md5 values of the old firmware shipped by trixie firmware-atheros
20250410-2.

$ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin
73056f1d2aff886ce9bff313f455e963  /lib/firmware/ath12k/WCN7850/hw2.0/m3.bin

> and have you ever tried the upstream mainline
> kernel or the latest ath.git tree?

I'm not sure what you mean by upstream mainline kernel, but v7.3 should
be the mainline kernel released a few days ago.

On the other hand, I just tested ath.git tree at tag ath-202610191908,
and it worked with the old firmware. So it seems there are some gaps
between v7.3 and ath kernel.

Shawn

