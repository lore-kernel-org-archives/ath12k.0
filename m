Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A03D2F338
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1YQEJELDgeOBsHf66sb+8lv6+PjEG4gBBzPY5MD9nE=; b=tZEKAlotB5yT3tNCncwAsnYS3/
	Q/U5Z0xabk+dqF4vQM/BS7GObVrBsl0b+/mE9faXr+reWook7d31+E2yGS7K2zxlZFsGq7aUFrTp+
	5Tcd31lsQSzBasEP4h14sBfZCNhK+TIckjNjBVN4g7h+T1IYCwSMFfa5ikJ50UQ3Q0VI+7b7s4eHs
	jF2UfJNfgyvMiVjv8wNKz8vCXcDSDWSb/UppbvKJx+X5HVr4jmiXPF3QSVCGBbkuQCoKXZiTtpD6I
	VH+WKj2PMUn2gzqb9YWmXrsEBjTgGEPkRjoGKDgmsvDcuUEtOkpAb2etTq3iQmmP2S+0fo+Sjcbx8
	AxWC2i0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgKp-00000007NKZ-2f2f;
	Tue, 13 Jan 2026 15:29:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgKn-00000007NJ9-1Jxo
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 15:29:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DEjKZa4080708
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 15:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I1YQEJELDgeOBsHf66sb+8lv6+PjEG4gBBzPY5MD9nE=; b=oBKv15so9AWLrpvK
	mWXHidOyFsD9vCaintLpaaECgveVS0oMPzvayi1G5hNODOe4beq9nyrLTEp1hVWx
	4taCJK55v1tpNmmc8hrGjpR9PZXf4tHKDoQwLHfZBdyXgvpD0s/C8zESdfkVroKn
	S8QvkFFIpqlb9LbhAxXPFQjyyOzD6i2vO5CpPjULNI23oQv2TEI4H54S7qbedviL
	aQp6YmAhMN28CwE2foU3PAEd9S0m7LISNsA8tDr+V+BzFMYTkQ2tyKK2qczpTSMo
	Al/hsDWoIfuvrGK6VJd3ug3tz/Ojt8VYI4dhA7BPleSl8GQvq/E7DQqTim2nhPDC
	v02m3w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e85cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 15:29:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae25c02e7bso26766779eec.0
        for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 07:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768318167; x=1768922967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1YQEJELDgeOBsHf66sb+8lv6+PjEG4gBBzPY5MD9nE=;
        b=QKoJ821pXkRGldj05x8wRpxX/2wPyQCh8BcHSMkh87Xq/tQevwUY9Va1C5EOjVeeK/
         kp+DCtupRQEFXGKQRIVCIXYfp5xpLSSOD22Ga6tCowWHkgDjTo1PyY4KpqjpDQaHLe5u
         Kh5BMKM1ncpaGd6BiYWkdEhagv0KBYAOO+Zj5m9XNGDDZT1eGJbJAnc0wcI0a7VSrqWK
         TxUOKRR/MEGs93Zmd3EBahZhiEX0anLa1+ysokO6uSAF3wRegTQ6E/To71lhzsjfEie+
         hf52Sl5OX++WndWAjFs4ApbJNrw/nToGVzWQm0UJz3sN9ZqR8wabTconzn9GwjyhrOge
         CqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318167; x=1768922967;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1YQEJELDgeOBsHf66sb+8lv6+PjEG4gBBzPY5MD9nE=;
        b=uwRMxNhRxu+wSXk/DN7CKMpPpVYRmv5hRK10FUCRDr8nsd8pMrBE6vaZU4taYRubJm
         +q3qL4EQ5cSCo21a6j6Zi1dhnkN9eYacEI1+mFbuvpHq60jlgb9H8ftplLs18Ljcmvq6
         gMmG6460bT0jD1eN+2xavpB/6zUF/UctchAr32Ei9/sGnrbHz4emjvoyifqcIMJJSHdx
         Rvn8QYjNcCL3vwDfgy55Yoh57udV+HbqV0RqSdILL5+DCgPCzQ1NzwFe8LxjXWh7thEW
         PVWu0gC7Gav0h8f/FbURHbax2wRLWQYRPg4SPkt8/tfjszoJZPFIooao4OQcSyPWJZYJ
         nw6w==
X-Gm-Message-State: AOJu0Yy3s+GqaJoayS9w8ovd/8XeWNLp2lgqwfbGlo6tU8UjRzl2HaRf
	mP98n3I7WzIWPzNNzX9MH8MLsCx0Sode0qTGkLkikQIb/L7pQxbKENldJOjxcv+ycIFAxH+ZY7t
	86WSDtr46WnaNRiMNd2OUPpYF0a/N8RAC7vxIHxOLXMXAwa7++NkVsm6cLfPKuY7e
X-Gm-Gg: AY/fxX7wJuEi2GZ7LeVh2YDuWkd2cEb8338zSWtQ0VD+UXMXCBKyo0IirteWJ1Y8hSA
	lSukiqUk7rpV06NKvvdvlonwtZCh9GAflvKN7/WZMmhZakjD0TiKS/wsIGDzsSjOQqwAUKHU4i6
	5RDIbQ3l2xRTmGYCQ99BsYJB4KvJp0/y8kFhLD/Ovp67pZGOyFmxqLCJzHD93J6ciG/oXrYWwlF
	8qEWnDaDQul9jD/aHgt3v8g8PFhULll1tIypItEJXuQVmzwJcH2hhUuAi3uI9sY/hfKHpnwARFZ
	zvzCepm99kthW2nCM6GFKegzvYIXxdg7uAl6qy3wS1yKynwZdeUX9oG/Q3At3NWrc2n4tKyUSHf
	AkzfeycHVlpAfK6yKksjVcuIUgwTRA4mnyj8k4QzyhBOeHX8VZwUsFKsBcEKvsNt3
X-Received: by 2002:a05:7300:f643:b0:2b0:4902:c0a3 with SMTP id 5a478bee46e88-2b17d2ed8ffmr14028261eec.20.1768318167367;
        Tue, 13 Jan 2026 07:29:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVgPAch4NqipoiWzw/8q3/FOsYxrzLxAILtvq7D2Z7aaan+UTMDZb2Vw/l9cxX7jf50Y/06Q==
X-Received: by 2002:a05:7300:f643:b0:2b0:4902:c0a3 with SMTP id 5a478bee46e88-2b17d2ed8ffmr14028242eec.20.1768318166830;
        Tue, 13 Jan 2026 07:29:26 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm16858049eec.33.2026.01.13.07.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:29:26 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
In-Reply-To: <20260112115516.2144219-1-yingying.tang@oss.qualcomm.com>
References: <20260112115516.2144219-1-yingying.tang@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix scan state stuck in
 ABORTING after cancel_remain_on_channel
Message-Id: <176831816625.3453943.16186403876839211866.b4-ty@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 07:29:26 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=696664d8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KdEc0S3GmNI-KGd16cMA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfXwMKviBAPcdl+
 sclJLq1f7Px8N0CkvsMOe41xF3c6qBSt4FqMw7yYaLzbuN3zb8kmQ+8vrZYRAwoENzBRunol0JN
 pudnJofXYDuW333S47lt3ufJOYwBKjHipVEmpMmIXSpBRA9hf7hWelCxU1Wt80vz3KF2yp3oXSg
 hfc8cdRabymcvoSmOJ8ck/tXAV2jp53Hz4LQ6Yfjks1PG49uDsm7kDtblsOmxc2dr0yUsp7dZcN
 K5fV4WAk9p3E9Q2yfmjRugFCuxENMuOUXYi0hxwQ/vBwxnz7PTWe3czX8dD0L2wuPVGqrklXqpa
 a/8tPEGuc1ZPx71oJ2iOtQdGNvt0PoJUl9VHhooSTmrqwWN3+/FCrcGpDQDSXpbd0LQ3K0s3o5g
 zUjDwTOfVx5Y3gmLdLnrmbeg+oTZG6A6XrgA6w0EOeUkJbGyqbSgcO2hwESG3wlTnmSBMhvTts2
 hOAPUXDgUPH6AB38IXA==
X-Proofpoint-GUID: 1BEtqVyZz4-_Y6R-aGxx2G5SLqf3-Xw-
X-Proofpoint-ORIG-GUID: 1BEtqVyZz4-_Y6R-aGxx2G5SLqf3-Xw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072929_471233_D94354BA 
X-CRM114-Status: GOOD (  10.35  )
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


On Mon, 12 Jan 2026 19:55:16 +0800, Yingying Tang wrote:
> Scan finish workqueue was introduced in __ath12k_mac_scan_finish() by [1].
> 
> During ath12k_mac_op_cancel_remain_on_channel(), scan state is set to
> ABORTING and should be reset to IDLE in the queued work. However,
> wiphy_work_cancel() is called before exiting
> ath12k_mac_op_cancel_remain_on_channel(), which prevents the work
> from running and leaves the state in ABORTING. This blocks all
> subsequent scan requests.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix scan state stuck in ABORTING after cancel_remain_on_channel
      commit: 8b8d6ee53dfdee61b0beff66afe3f712456e707a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


