Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1883CCA470
	for <ath12k@archiver.kernel.org>; Mon,  6 Oct 2025 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5Y0dy/F8Pz45kdYzohc/CFHT9Z/aYMWJpsquGb0Ud8=; b=kq/WaxiG10bsM1RYhflsUVw4aE
	hjHhlFT0oqQlohCYQ44lxovRluLSUzDPrEFknbAb9MjIona8fRNj3RcycGlZlbVWCuyEzxw0mV3Xe
	2TUJ1IR5sGa5nFwW9HlV5KBfPfXY/WKFWVqFnsB+AR9pg3n9jQi4YWWp1Cp+LR3ALFbhZZQhgbBT4
	8Y6MxZI6d23pOi+WY6CmjUQyBhMIz+jgxe2utmayzekCFOAsHLnnGVVPexvMb6BnsNENkxkL49zXq
	eOk1gJYaJMrIKu/y1v0Dnrl5YkP82qlDI/nNPsj1+LUVtD0wBB38PC62i6qi0RLMzykKzpZ7HVM9J
	fusZFKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oRK-00000000S0r-1WXZ;
	Mon, 06 Oct 2025 16:51:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oRH-00000000RzY-2rN5
	for ath12k@lists.infradead.org;
	Mon, 06 Oct 2025 16:51:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FVEnC002205
	for <ath12k@lists.infradead.org>; Mon, 6 Oct 2025 16:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5Y0dy/F8Pz45kdYzohc/CFHT9Z/aYMWJpsquGb0Ud8=; b=PAmEkhCIUQFK4dYv
	IkEHkZZJliZ+6A4Lf0oKeGWrJmfDrBGsc/MGNiWPFYycRw/S0/qRchm3lpASiUrJ
	IwBGts0l4JnsXkAU/D0VPPagWG5XjQ+qVHyydDtlyG9+1bJOAVmlVTYsDdu5EJFz
	jIwhMVkpcDGMKJpGkzhBi0VKq5s85uvn8MIc42WWuL3Aw5UdFCHzdq5rOFDXvF3G
	s0NMGoCjPgUfN9f2fdOXAB4iVChrWHkyMelbZvTQBMlxj3ob23Puk2f8Ra66HyeO
	F8TM6pwPdh8iD2k9/cKv/0mtBQICYTcXn4aHFKYoT6GYE3B8//F6MbRaAfilWFFE
	MRjT2g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1mft5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 06 Oct 2025 16:51:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55118e2d01so3383181a12.1
        for <ath12k@lists.infradead.org>; Mon, 06 Oct 2025 09:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769514; x=1760374314;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5Y0dy/F8Pz45kdYzohc/CFHT9Z/aYMWJpsquGb0Ud8=;
        b=DHVtNm+rvbJ984/B4vSkK/58d2pJN5FOgwbzAraiysvcMBOF79xAcpoHgMP0Z8IgDv
         QOlFaZBAkgF5ayqSpCxeHiCyt0lzpGn+tDTCNxs84kBr8eswmynWQ9y4a+dC39FSkNjV
         Ee9VgvGf9L4+1OO188Q7rUb676+ZMd6FBSR0qLE/KhKA1OBSZ1likrDREDEZhbQgKuNW
         Ib0T84dU2bCel6TAeb3dL9Kut/J7cvgMT/w8CvM5kV7DM/eSva0tPLUFZNxE+OFPmCOA
         0oMwLhmw3LCzJEA7ic/6tiXNCgAQT/YGgca6ywI7Wqb4GFIaMrfyE9X+HLoBJeXSY8Cz
         WYGg==
X-Gm-Message-State: AOJu0YxiG4KYZHa0P30CLakRXHOMmRK72pUu8czNZf9+lLSqQw+CK/KV
	HEJ3Th+UqBLWt5iGomuHgkWPrkC7t3D3MdxVSkeflhMTivtHDeWFsjyBKvg/3Ij9KJMFSBY1+pm
	3yIgov2oQvafwkiDRU7F2l+Ym3ihhe0SHewT1pHcEt6tLMgBRM86//FQEiVMBtQCL
X-Gm-Gg: ASbGncukNrkJq5OxqClfF0BFZBLJrNustFKtsjOXg9+GCQPS9o0KIMQi4oh84VtQz7z
	vH3U4Z7VCrqp2Lrr9X645OUT96esmbUegMtitj+LUN9Bp+1x0tuKBsgw4S5pinhpLoFm5BgZE4y
	/eXnWiBILl2Gp44CoBBFWZRcX21ovGsgnUyVAz/jUNlg+kWRZEN/d5hyojztu9cRzYgZSv2XQAE
	4YIh9ZBKfciAiHaTtSD7f4Wv5+LL7/ZBB8/Ti8GNDS7uaO9+zPsYWHyPOjhOJ6dsNmhcNzGtgA+
	2qmooTBNinyVBWKW8wR+b+Q+cyBw19tc8pUxAnZhAy2UiRzSFLB99XKiGiL41nIHnFa0bcYVCSZ
	7H7tFhg==
X-Received: by 2002:a05:6a21:99a8:b0:2bf:183c:ac86 with SMTP id adf61e73a8af0-32b61faa91cmr17495529637.25.1759769514481;
        Mon, 06 Oct 2025 09:51:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvGS2+2bERqXDVvsSZ6rUGgEMnvB3AZRH2DdaieSwuHIHS/UvGTmiII/vKFnMeBdBH2V3S8g==
X-Received: by 2002:a05:6a21:99a8:b0:2bf:183c:ac86 with SMTP id adf61e73a8af0-32b61faa91cmr17495493637.25.1759769513828;
        Mon, 06 Oct 2025 09:51:53 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0205336csm13293176b3a.45.2025.10.06.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:51:53 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>
In-Reply-To: <20250923220316.1595758-1-muna.sinada@oss.qualcomm.com>
References: <20250923220316.1595758-1-muna.sinada@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: free skb during idr cleanup
 callback
Message-Id: <175976951317.3451922.3808648885786905191.b4-ty@oss.qualcomm.com>
Date: Mon, 06 Oct 2025 09:51:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: OyKOhq8QJDEMg8lEr8Nbg9NIZYMqY4BY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfXwo+q0FQlhzge
 BqDOPSBK/eg83v6Y3pUVLLJ2LHqi1aGHwL3Y6gN8U3uJR7xqOA5M8CNg8RKeL1sdGKZW5uiIs+m
 8KFjERU0mUsZ3A5HhQs5iE53A6dasS4Pi0KNkr8SVM6quKHD+Q6YVwT07CULm0pdE5b/U3ogUzj
 9o44+rOrIzf7MyKIYnNm5uRrSyHKzVyNItimRkcm1WYWnAHNt2sxv/H2W1XU6fpf5sah3/1YfiU
 YJRcPqMMDaUL3nkhh+kiy4b9mL51kvJVuXC6/wxSipZHq82W4iULSSWT84GfLVi+K/6F8nS+cDm
 4e6ZmmztHJKIO0EJEbQ2OZ/TYXYbiHzjqm9rVu0/pG3fER9jt+FL1Yw6lxfcMg99ItaZXUkZH8E
 h5DE3fV1upqdlksHGxHk1pahLuoqVw==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e3f3ab cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=m_DE0tSJwjRw9Kafi5QA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: OyKOhq8QJDEMg8lEr8Nbg9NIZYMqY4BY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_095155_725033_52EB63AA 
X-CRM114-Status: GOOD (  10.36  )
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


On Tue, 23 Sep 2025 15:03:16 -0700, Muna Sinada wrote:
> ath12k just like ath11k [1] did not handle skb cleanup during idr
> cleanup callback. Both ath12k_mac_vif_txmgmt_idr_remove() and
> ath12k_mac_tx_mgmt_pending_free() performed idr cleanup and DMA
> unmapping for skb but only ath12k_mac_tx_mgmt_pending_free() freed
> skb. As a result, during vdev deletion a memory leak occurs.
> 
> Refactor all clean up steps into a new function. New function
> ath12k_mac_tx_mgmt_free() creates a centralized area where idr
> cleanup, DMA unmapping for skb and freeing skb is performed. Utilize
> skb pointer given by idr_remove(), instead of passed as a function
> argument because IDR will be protected by locking. This will prevent
> concurrent modification of the same IDR.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: free skb during idr cleanup callback
      commit: 92282074e1d2e7b6da5c05fe38a7cc974187fe14

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


