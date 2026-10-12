Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1DACA9ED5
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 06:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUxlyDgqEOga2eH92OrryBq0GdzNwjPdv2fabUdt4ck=; b=T4rC51HVt9wGCGQim9nw1cOT9b
	BKBRb2iJlWe0zZ7kc8lJkFkCRM9z4DDgYLuK3QQSfxFWkef09kmgW3us4gR58mnjd7HW19cIEXlhy
	y/lj6I5mmM5Q9P4kY80PJWqu/XtKNWG9tKx/KPwP64N4oeQXHFQOinooHpRwf+nEBQYWod7GA63kL
	eIrP+A0Zd6GJi555c2Neqc0P0UBLYuHSvIIyISCkO6LQRkpX2JW9rXqlW0VlDGQqRo+NiU0XpmwGE
	1X7GmsxUd4mpXgGxnNyscvbD6iFrYGZxpW3O4iK2NuQr1VRY1eFUXug0oF412dvCaZRANPksUhCQK
	YSVuLCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9On-00000009ig8-3JJq;
	Mon, 12 Oct 2026 06:20:37 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9Oj-00000009ifm-27hQ
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 06:20:35 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C56CgP3242365;
	Mon, 12 Oct 2026 08:20:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=eUxlyDgqEOga2eH92OrryBq0
	GdzNwjPdv2fabUdt4ck=; b=F1ire1tSg3VQbd53C6dQ0GWtYDslb2OlvnkVSXjS
	U1yD6hF9RhVKI00m9gYtLCIL+BXqXO6mdlAgzKd7QE+3RKik1yb8deh24En6toZT
	sChgO3rIe7t8gmjQMQinitkR55U494Wt/QCKEslgg1orSsTtIxMDiXCUHO80JMnF
	Vq5eL9fLNceyAdcjd4BPxZZeIHwChf42pkb0HdmPRvaE85xUoUlicxaeqLmerXBr
	JLhyPnRB++8BgoJg7WZMUw8RWzsRDV5B8bd8ZWnLPcJnB8VkakNPAd7CudHFnKpf
	1yL10GDWrOts9hFBQqXJMDJ+8ETglaxeAdt5NwKJc6Ubug==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022133.outbound.protection.outlook.com [52.101.66.133])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4h7nfj1g5h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 08:20:20 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSjn1A1Z6cWOLKzemrGSj2YGy0NdV2c0lNUOFspEiDCTNTCLgdY+/Pyx4682J1sU/TXwIKz17Prae00TL02DcfYL7D0TrA/6fX9Spt/G0dRJFvYXv36Pz/DH9wCh1HkwD7Tq0H9BNw+pJ6CkgDUP1130vzv6sYJI8eS7+UCiF8Bg+AuzjBfcfG8mmfm+ConVtZwhq2zX2xKodRTqEcyldh4Ye121NtNCTX77D8G6sBhYpjSV8WuXeVtTAhIjGHZb/n7D/FgEV5VWIhqlT157JEqIyOfcmyPEA95PBz6pL9O3qexWlSWFCIWiNvtjLRaPgEYXDE6ltEyF7IRMD8pBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUxlyDgqEOga2eH92OrryBq0GdzNwjPdv2fabUdt4ck=;
 b=bmDtNRTa9s9phBbYsyr4ve5m3a+VeTcOTs30AawI0yQhYHFzw6/eaYSST5dHqrSbi+/xOi16qWURQcLZUojJrGI/osmvHMZIfrxVhAXelo+5YnV7UGtwVUbhCTK5Woc5NZu1IEqwZzRdpt2zn8HRZ30CNiTbDq43oehTAGa473IJs+Tz+gLrnP6cR8EfqlgnJF97uM9rYXgQW9fpoNkmc6T24ULJ0Gphv+PSbKwnl0Xq7CLm1UTOBV41o+NhmHyPRCptWC5cFrpQ8ryzRLqBTHCdjo2Av5THJf9bJHAHXsD/jdA523Qp3TSIVhDp1uWYsy1puZ5ncR8SS/ggIp1lpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUxlyDgqEOga2eH92OrryBq0GdzNwjPdv2fabUdt4ck=;
 b=JV7K9YKg+hEjiHRGpAris/mij7EoUbjExwv/Mxty1v6qk4IWQxGxODyjMD1Oby5BsKuPF5yU2lEe1wbfRARqJ4tyXSf/mCLA5qB7b3MDoPaVT3HOTjWQDE8Y4SRLBCx1ZPI3gdS8rEXp4vmKs17WHIxblzpkqov9lMVlBwT+rjM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PAWP192MB2276.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:364::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 06:20:17 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 06:20:17 +0000
Date: Mon, 12 Oct 2026 08:20:14 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Thirusenthil Kumaran J <thirusenthil.j@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-firmware@kernel.org
Subject: Re: ath12k: inconsistent regdb for QCN9274
Message-ID: <asx8HvB5C0eAQ_D2@FUE-ALEWI-WINX>
References: <ap-vTGZiqGaodxKE@FUE-ALEWI-WINX>
 <70e4a7fa-6595-46da-8465-38906a41a6f3@oss.qualcomm.com>
 <art3FqNHatt7zjLZ@FUE-ALEWI-WINX>
 <443818dc-5555-4f65-88d3-6876505baae6@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <443818dc-5555-4f65-88d3-6876505baae6@oss.qualcomm.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: OS6P279CA0122.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3b::14) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PAWP192MB2276:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0b446c-73b0-4432-7b34-08df2828e251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|18002099003|22082099003|3023799007|5023799004|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: AECCIk4Jcghv6ZovwGXvOeh5KhC+5h1x0NehyJw8fEB2RUlFtcdDuK0T6ya2tziwlXAmL/EAR8cjwt4JKpJOeHK9CsSyovbZRolmatN4R6XCTBZUtPTj9hu32XHIrlbWWLqKvH5hS8cjlQfLOKGP2pmC2lBrhtS46yKJxv7zyHqZlSp/CBPkB7iY/lRMP2pi7kpt33Fbco1Zi6OhC6b8QlHlyStVXSZ7p2dJX2U7D0ToZ2eaxXZGjl/N5P/eQ0PIS1RXTN2SrXyWcKppOdLzVRSiefPa3YyRv9AbLZFO9AqTA1+DZnnq4jMD1FDr9amdTSdyDZw4p8SWwgvp+lRPD05K7quybebjKQxYtktQIiiBvvXw0toEqWtUnxHHCd/Ktyor5N+3V+BYWoIS4swaMHq+E41RnEUqDREw2/VZhkUk6BXEVWq4mLlJponv24dat9mYExkP1MuoCjwGC/RaZVcp1Qjd5cOWI55WT8CnnnJzwPgDCk9pgkAIwdIdz/UNPC0EZhUuranGCVq7HiBfd5RbJYk8WLjZ5k7Rugjvl2AfL52p4gpqiPAYs3Spr777BrQmRKZNW4ikFPx5FK7wtbjO3lXMt32fhpdj/05Pe5KHWCuIJfUIoK1hQS2D8HEMhXs8lDoUD6zGuW6ZA/j277FQYZ8/70Tlz4V6zujIaqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(5023799004)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Bz+wXEgEYECNLKyZX8iQxmN8ZymN6+q6un5i/3BhT5xTrzZONq1pmE0kDWX?=
 =?us-ascii?Q?e4bY+cRPG8hzMbJq6ue3CbbwV/sT5ZWBJ51F7Dcb4ERaKDTql150bB+ukOFz?=
 =?us-ascii?Q?MwgXener2DmZjSx25QRRXFc+5EDE5YXNnoiD/hr/RnkktgEYuOjbsnF3nhHr?=
 =?us-ascii?Q?eU9nbDnx3QFKWdEETmjrGb2imoyqAy8qRTdW4qqyysT6kw0FD3tHtjm2KBgn?=
 =?us-ascii?Q?G506/wKOqJSN7Yaam+UNsukFBr5j/F8xMz5AsSvTxUKi7jp3xZrQ9G+bf/d3?=
 =?us-ascii?Q?7XthJWCktY13zUiyiSBtWGYqjZ9ZEyMDGRUFEYpAHFJHZvcjGxS6nFD7cU5V?=
 =?us-ascii?Q?DCiv6DN9Ka2CBW+3XN/Iu6oBqrNBhcFiMktY95UOGOVSjR2RM04dwGnRFZ7X?=
 =?us-ascii?Q?0+VdP3rOVxY+cAgaMhqye9tsJDQzbr2Wqscru4jq7Cf4/l7djl+UCeY3Gwna?=
 =?us-ascii?Q?oqHe+NgWhbVVKAASA8hmmbUbv+AWpSRyRBGmkseN4W8oFeUrXsGaspsVV5fB?=
 =?us-ascii?Q?jTq5hP7Ah8kcJ+TrpaLVl5TjzOVyCKv6j4Kk6htbMVWWxjT8hfLcpDUJ2W5U?=
 =?us-ascii?Q?xkIp4XgV9GcXv/RPvwpyVUHNsa+0soMwvBgNmVYAnrQsQOEXeu8MEPHTuLSN?=
 =?us-ascii?Q?O3Xz+DaF1IILV4nO39BvGwl7nY3TlauEkEGSgf0/OBeki6QPZ6OAu4lsvjrK?=
 =?us-ascii?Q?dWaXovxiBIU1cllxcHekbJPV6Iykfb8iHHFhAPBxNcLG5vJkhpJrbYdrzmHh?=
 =?us-ascii?Q?u2q5n9n3TKeQDQ+fxBlf4zn4sIbTCG3/7D7cV47aBfuraq7VMRx1y3meeBgG?=
 =?us-ascii?Q?jp/G5nnPopU6mFVrzuODZ+crPXaRKrF2CZISouKkOJfEZTsES/6Elm0NON0N?=
 =?us-ascii?Q?mQYMGaYMRmkLHfDawB2wVgVvNNcxyFxtRXCikG1IIa5ZinEtJmcyF+OHf82W?=
 =?us-ascii?Q?bEirEhtpSzgic4pNi4MMBn1GeUpGOoAi+19Cd1noU0F9zx0ZBk/I648Q/Cic?=
 =?us-ascii?Q?Hl1h9W+JUcM6pkZC12r4MVvUN4kD9wgniSzT8fzDGoG+Sr+cTjdHw3pliNww?=
 =?us-ascii?Q?SGZY9KgqAjDSU+184JwShKUOEFOiTDc4IqNyFb2PZsAYZGDFlIiAenQlizcr?=
 =?us-ascii?Q?K2NOC160Hl4LQ3A8siTpIJdO3R3YrozS441B3Q4EMRWHap5nCU6izyahBMPO?=
 =?us-ascii?Q?iLUg07ZJL9sYwHYZyQEaKJLiilYSq9Iu8teyumy4bp8AZNWTn6kySmd9hUTe?=
 =?us-ascii?Q?5omNLqDLt2uFPhJibP8nGFeWd4iiw71mhoe3DRfpMupywhImhlkG6HmHQmM4?=
 =?us-ascii?Q?j8yOumO0ooAN6FY/WaJb90HegAU7TMNtctqSK9HV71P/raeEIO8fAVOt2Nj5?=
 =?us-ascii?Q?WrIdQDUMzENrHHj5mZ4F9epwHRY2zLORZTcqWKv68ClRrAf4Yt+o41aOamn4?=
 =?us-ascii?Q?GnWs8B30IH7WIcc8rD5M4yGEnP+kYx130wKf2QVzUwMNOD64LbawMMEi6Twq?=
 =?us-ascii?Q?YLQ+TFQ9PnI2jXi8rv7wdMA8DqoLhRmZvkRrMYqDdO6G3I7F/o9IglbVUHAK?=
 =?us-ascii?Q?5/UAi7sJsoWm61EfYZeEXTzzTHLfQ7PDMnIYEaz+Epoq89QtyXj5vx07Iqfp?=
 =?us-ascii?Q?iAW9b/IKiOnb8VuM0j77zWovtnPY1mQUTCHlpYgVzOjqdNwtjiQBOLxfIRB5?=
 =?us-ascii?Q?yZgl34IKMtMhUxub4zJsYJqIKttdWNvMm0jHq9w0HFbusj1MJL4/Q8aZuJP1?=
 =?us-ascii?Q?FEjC3BN7vA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 1qL63s7eu/COHJKFv+J3S6SEjZVD3oqm+5iURzQxNBiCKwTjLO4iLCNI2HIVvV3KF+VE7Kmkv7dBu1RzUGfOxix9BQphwuh1qdrf4RjFY3CQ4g3q/rDTi2YZDadO4a0cYXVs4/vDkP0k8DtiXPG4j0VVNg2AhIbuOZNNqHQU2BFvPEO3EM3U3cD5xMXOeFiknUuFnfJFFeTzuZ7H7WSUik8+/k1WGB36nso5Nk5fEQ/jzeZq/syRfB0VVIGK5vQfpgA4M78e5sN52K97YfOJIcTRKTZVGaYp8CCCOrcuOsnRNhsgq8yzvfxfS3OeG9UgG8/8R2hdL0zxQOcuNkuF8w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FUNV9v7vH3A4xNkj+2Yw4HIkgopuhjrG4G5hguwMddn0oYjuyy1K/9tzg0FP4PLEHZD88AENUlyLaJde6q6k3SXUw64RgnmYcbKUtL+OY4aB/Xfk7NZmOXun5kcUewsttp04lTbtOlWZHBtun/JI4Xy59RX1UYcBo7zPbOp4fgxqcq/vdtv/lf6dF1+E9yhOf/kou91RZz2nY3gNH7QEN9ugG5HmGD1UB66gv1G6lpc5VdZm+mibYLbYzAWCNrXK51H8JBHdc8HlfyLjPhtSiqbP2X7NOEVjdoifjnk2szyqRPPo4XPqBvjZC+EcEERnQ+a+faBjOujgf5uaq/rJatm3Jcc22IFdxJh070QuX1gT2QUDtNvbpKKLUdeEW15aS9QPFT5NAM/b1d9jwkusnmqEUhfRWAobwqIodNEZhHs8CXl/CO1lW22wefFo1+hB9E3suxdImNPOaXyISB3QPvce4cShmoUxTfGtrhzk07PajYsYF1XIdw28jQHSfBeBn6tcLGRI/ssxnEEkr8PwUN6LpcvF55JY0t88eqB5oS9DnIxr+HTxHFgmms19ZEfelwTL+lK5cG7rCvMoJxy4sQ5oxJeKD+2rIjmNEkH85qzQghaty2xA62S4A71rlSd0
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0b446c-73b0-4432-7b34-08df2828e251
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 06:20:17.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVPZ/2TsvTGIC0Cf4URPyEgrltuXRNBXMlVC1APsWO8uNio7iyAGmJQ53ajVOz0eD245uJJQ98efxrOx1P+6cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2276
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission: 
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: PAWP192MB2276.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: cLAurqfOmOf3vNKYrDIpQCdK7XlP0gb2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX0/CRvptFdKdQ
 U0z9hGEqOLJWzwNcBBa+jW941JAITJJHQzmcJKulMoYUxgRgIFyQ5dzkZiqJtFnn39IyuooAzW/
 lsDnD8amqQPA9txfIc5wmE5I1/hBdII=
X-Proofpoint-ORIG-GUID: cLAurqfOmOf3vNKYrDIpQCdK7XlP0gb2
X-Authority-Analysis: v=2.4 cv=Z9t5j3RA c=1 sm=1 tr=0 ts=6acc7c24 cx=c_pps
 a=0CLVQTjxhLEs4UItc+c3Og==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=xNPjJGTIY6okPvH5OjsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX7ILS31H1olSe
 QtMcMEn5lPmstl2XmW13lo7EugK6seV18ySLZTwfcHVYT0JIwhLG9mGliYhGvnTfqsr0d6Xqnpy
 1a7vc8Q3O+L3q4kuCobGOUNOCW3xlALfGPS/WYf1ZBFCWsDfqdpj4IfsUO8g8ToW4OsqxV/1Tta
 kfuN51qkTsSg+iW5KQihmM1c0tWvdJFZIZ3oQWOLYpsCY2uV0TC+CvpcscR+s82eh+4wealiWdR
 eOYtW5PelydQv7mbJDVZiDOgY1haYbibqm9TPVU/LpxqpLwgYnr/oqN3vHxM3mpxmd67hX573DE
 uHUXwiHnXZ9W6v7kIo7nytpKkPXaHMEm/JAblXPps414MsQr/5tilF2XsoFmAN/o3dDK+dHBeHV
 BuhdTMD0q2Sx1SK4xqFVTjJ5zdQeBaTHw8Jsq6Ou9aW80pAqjA2iOifEmEhrqgFQPohaYYJ4/FI
 3GAT8hRZsbIrzGrU2NQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_232033_886391_0E730162 
X-CRM114-Status: GOOD (  32.94  )
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

On Fri, Oct 09, 2026 at 03:06:04PM +0530, Thirusenthil Kumaran J wrote:
> On 9/29/2026 2:00 PM, Alexander Wilhelm wrote:
> > On Fri, Sep 25, 2026 at 01:36:39PM +0530, Thirusenthil Kumaran J wrote:
> >> On 9/8/2026 12:16 PM, Alexander Wilhelm wrote:
> >>>
> >>> Hello Developers,
> >>>
> >>> I am using QCN9274 chipsets with the `ath12k` driver on my devices. As far as I
> >>> can tell, the driver uses the regulatory database from the `board-2.bin` file.
> >>> However, some country definitions do not appear to be fully implemented, as the
> >>> values differ from those in Linux's standard `wireless-regdb` repository. I even
> >>> downloaded the latest `linux-firmware-20260810.tar.xz` and do not see any
> >>> related changes there.
> >>>
> >>> For example, when switching to DE, I see the following values:
> >>> * Channels 52-64: 23 dBm; I would expect 20.0 dBm
> >>> * Channels 100-140: 30.0 dBm; I would expect 26.0 dBm
> >>> * Channels 144-173: (disabled); I would expect 13.0 dBm
> >>>
> >>> US also appears to be inconsistent:
> >>> * Channels 36-48: 30.0 dBm; I would expect 23.0 dBm
> >>> * Channels 169-173: (disabled); I would expect 30.0 dBm
> >>>
> >>> I am aware that `wireless-regdb` is intentionally restrictive in some cases. For
> >>> example, there are rules where 26.0 dBm is used instead of 30.0 dBm because it
> >>> is implicitly assumed that TPC is not supported. Therefore, some differences may
> >>> be expected.
> >>>
> >>> However, the values above still appear to be incorrect. Could someone at
> >>> Qualcomm please investigate this and fix the regulatory information if it is
> >>> indeed wrong? If the current behavior is intentional, I would appreciate an
> >>> explanation of how these limits are derived, as they do not seem to match either
> >>> the `wireless-regdb` entries or the applicable regulatory requirements. Thank
> >>> you in advance.
> >>>
> >>>
> >>> Best regards
> >>> Alexander Wilhelm
> >>>
> >>
> >> Hi Alexander,
> >>
> >> Our internal regulatory team is reviewing the source and rationale for
> >> these values. We would also like to confirm which BDF was selected on
> >> your platform during boot.
> > 
> > Hi Thirusenthil,
> > 
> > Thank you for your response. I am using a WLE7002Exx cards from "Compex Systems"
> > and have also received the corresponding custom BDFs. I then added them to
> > board-2.bin using qca-swiss-army-knife. For the regdb, I am using the default
> > version that comes with the kernel (the one with ID 255).
> > 
> >> Could you please share the following details from the affected platform?
> >> - The exact platform/board model, or RDP number if applicable which is
> >> used with the QCN9274.
> >> - The complete dmesg output from the affected boot.
> >>
> >> In particular, please include the ath12k QMI target-capability messages
> >> containing information similar to:
> >>
> >> chip_id, chip_family, board_id, soc_id, fw_version,
> >>
> >> These messages are printed from the 'ath12k_qmi_request_target_cap()'
> >> function. They will help us identify the chipset, board ID, SoC, and
> >> firmware version, and correlate the selected BDF with the regulatory data.
> >>
> >> For a quick filtered view, you may also run:
> >>
> >> dmesg | grep -i -E 'ath12k|board|bdf|chip_id|fw_version|fw_build|soc_id'
> >>
> >> With these details, we can verify whether the reported channels are
> >> included in the selected BDF and continue investigating the regulatory
> >> limits.
> > 
> > The wireless modules are running on our in-house board based on a PowerPC64
> > T1023 platform. I am using OpenWrt v25.12.5 with wireless driver backports from
> > v6.18.26. The board-2.bin currently originates from v6.12.94. The dmesg output
> > (without debug messages) is provided below:
> > 
> >     user@host-A:~# logread -e ath12k
> >     ath12k_pci 0001:01:00.0: BAR 0 [mem 0xc00000000-0xc001fffff 64bit]: assigned
> >     ath12k_pci 0001:01:00.0: MSI vectors: 1
> >     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
> >     ath12k_pci 0002:01:00.0: BAR 0 [mem 0xc10000000-0xc101fffff 64bit]: assigned
> >     ath12k_pci 0002:01:00.0: MSI vectors: 1
> >     ath12k_pci 0002:01:00.0: Hardware name: qcn9274 hw2.0
> >     ath12k_pci 0001:01:00.0: qmi dma allocation failed (29360128 B type 1), will try later with small size
> >     ath12k_pci 0001:01:00.0: memory type 10 not supported
> >     ath12k_pci 0001:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x1005 soc_id 0x401a2200
> >     ath12k_pci 0001:01:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-09 20:09 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> >     ath12k_pci 0002:01:00.0: qmi dma allocation failed (29360128 B type 1), will try later with small size
> >     ath12k_pci 0002:01:00.0: memory type 10 not supported
> >     ath12k_pci 0002:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x1008 soc_id 0x401a2200
> >     ath12k_pci 0002:01:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-09 20:09 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> >     ath12k_pci 0001:01:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems
> >     debugfs: File 'ath12k' in directory 'phy0' already present!
> >     ath12k_pci 0002:01:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems
> >     debugfs: File 'ath12k' in directory 'phy1' already present!
> > 
> > 
> > Best regards
> > Alexander Wilhelm
> 
> 
> Hi Alexander,
> 
> Thank you for providing the platform details and dmesg output.
> The logs help us identify the two QCN9274 devices and their reported
> board IDs. They also confirm the firmware being used.
> 
> As mentioned earlier, our internal regulatory team is checking the
> reported TX power restrictions against the regulatory database and
> reviewing the source and rationale for the DE and US entries.
> 
> Since you mentioned that you are using custom BDFs from Compex Systems
> and added them to board-2.bin, having the exact final board-2.bin or the
> corresponding custom BDF files would be very helpful. This would allow
> us to inspect the hardware-specific frequency and channel limits and
> rule out any issue specific to the custom BDF.
> 
> If possible, could you also let us know whether the same behavior is
> observed with the unmodified default BDF? If so, we can continue the
> analysis from our side without requiring the custom BDF.

Hi Thirusenthil,

Unfortunately, I am not able to perform a test using a default BDF. I downloaded
the latest board-2.bin from linux-firmware (linux-firmware-20260916.tar.xz), but
it does not contain the board IDs reported by the modules I'm using, namely
4122, 4101, or 4104. I had also assumed that the default regdb (ID 255) would
contain all regulatory information. For example, here is the output from the
linux-wireless regdb in my current kernel:

global
country DE: DFS-ETSI
    (2400 - 2483 @ 40), (N/A, 20), (N/A)
    (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
    (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
    (5470 - 5725 @ 160), (N/A, 27), (0 ms), DFS
    (5725 - 5875 @ 80), (N/A, 13), (N/A)
    (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
    (57000 - 66000 @ 2160), (N/A, 40), (N/A)

And for comparison, here is the output reported by the PHY of one of the
modules:

phy#0 (self-managed)
country DE: DFS-ETSI
    (2402 - 2482 @ 40), (N/A, 20), (N/A), NO-80MHZ, NO-160MHZ, NO-320MHZ
    (5170 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW, NO-320MHZ
    (5250 - 5330 @ 80), (N/A, 23), (0 ms), NO-OUTDOOR, DFS, AUTO-BW, NO-320MHZ
    (5490 - 5590 @ 80), (N/A, 30), (0 ms), DFS, AUTO-BW, NO-320MHZ
    (5590 - 5650 @ 40), (N/A, 30), (600000 ms), DFS, AUTO-BW, NO-320MHZ
    (5650 - 5710 @ 40), (N/A, 30), (0 ms), DFS, AUTO-BW, NO-320MHZ
    (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW

As an example, you can see that the 5 GHz range only extends up to 5710 MHz and
then resumes at 5945 MHz. As a result, I can only operate up to channel 140 and
not channel 173 as expected, which is available when using the US regulatory
domain.

> Please share the dmesg output from the default-BDF run as well,
> including the board_id and firmware-information messages.
> 
> Best regards,
> Thirusenthil


Best regards
Alexander Wilhelm

